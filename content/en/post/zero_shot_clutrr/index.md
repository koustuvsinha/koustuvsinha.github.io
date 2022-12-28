---
title: "LLMs can sanitize annotations! Using zero shot relation extraction to fix CLUTRR templates"
date: 2022-12-23T17:45:00-05:00
draft: false
commentable: true
---

## Introduction {#introduction}

It has been three years since the release of [CLUTRR](/introducing-clutrr/), a benchmark we created to test the reasoning capabilities of modern neural networks. The idea is simple: can models understand first-order logic, in the backdrop of kinship relations? Specifically, we test the ability of the models to perform _implicit_ reasoning - figuring out the relation of two characters in a given story, where their relation is not provided explicitly. For example, consider the following story:

> Linda and her sister Stacy disagreed about what to make for dinner. Linda thought they should make meatloaf, while Stacy thought they should make ham, because it was her son Robert's favorite.
>
> Q: Linda is the _ of Robert.

The correct answer of the above question is "aunt", which is not stated explicitly in the text. This is obvious because we can internally compute the following _composition_ of relations:

\\(A = \mathcal{R}(\text{Robert}, \text{Stacy}) \land \mathcal{R}(\text{Stacy}, \text{Linda})\\\)

where, \\(\mathcal{R}\\) is the function to extract the relation, and we get the following _facts_: "Stacy is the _mother_ of Robert", and "Linda is the _sister_ of Stacy". Combining both, we get "Linda is the _aunt_ of Robert".

The use-case of CLUTRR is that we can test for arbitrarily large number of such combinations, and therefore test a models ability to do _length generalizaiton_ - testing its reasoning abilities in problems _longer_ or _shorter_ than the ones it has been trained. Theoretically, if a _systematic learner_ is exposed to all possible binary compositions of relations, it can extrapolate or interpolate with ease.

What we found back those many years ago, is that then neural models (LSTMs, RNNs, MACs, BERT) were unable to perform length generalization. Since then, there has been [numerous](https://arxiv.org/abs/2007.06477) [papers](https://arxiv.org/abs/2112.00578) published which used CLUTRR to test the compositional generalization abilities of the models proposed, and improved the state-of-the-art significantly. However, length generalization still remains an [elusive problem](https://arxiv.org/abs/2207.04901v2) for modern neural networks, and a combination of factors are needed to make it work.


## The issue with templates {#the-issue-with-templates}

Over the last several months, I have received feedback from the community that several data points in CLUTRR contain [glaring issues](https://github.com/facebookresearch/clutrr/issues/15) - they contain incorrect kinship-relation logic! For example, consider this data highlighted by Github user zhunyoung:

> [Kathleen] was excited because she was meeting her father, [Henry], for lunch. [Howard] and his son [Wayne] went to look at cars. [Howard] ended up buying the Mustang. [Howard] likes to spend time with his aunt, [Kathleen], who was excellent at cooking chicken.
>
> Q: Henry is the _ of Wayne. A: father

As the zhunyoung correctly points out, this is incorrect as the answer should be _"great-grandfather"_ instead. Now the question is, how did the CLUTRR generator end up with this incorrect example, if it is built using the principles of first-order logic?

At its core, CLUTTR consists of entity-relation pairs which is built using a fixed set of [logical rules](https://github.com/koustuvsinha/glc/blob/386cfb036a37aa65d29c7dbde01f70f067f03890/rule_bases/clutrr_0.json). By recursively applying these rules, arbitrarily complex chains of conjunction "paths" can be created. This entity-relation chain is then converted to semi-synthetic language by applying templated stories. The basic version only contains the template : `E2 is the {relation} of E1`, where `E1` and `E2` are the entities. Replacing the template with entity names, CLUTRR generates compositional puzzles of the following form:

> Linda is the sister of Stacy. Robert is the son of Linda.
>
> Q: Linda is the _ of Robert.

However, it is clear this basic templating version would be easy enough for the models to reason on, as the input lacks complex natural language formulations, and sidesteps the problem of entity resolution, coreference resolution and relation extraction. Thus in CLUTRR, we collected a bunch of human-written stories to be the templates. These stories are written by Amazon Mechanical Turkers "turkers" when they are provided with a family relation tree (set of entities and relations between them). During generation of the data, we dynamically select these templates and stitch them together to construct the data (see our paper for more details).

Given the error pointed out by zhunyoung, it is likely that some of these human-written templates are incorrectly written. Digging a bit into the collected templates, surely I found the issue - the template used in zhunyoung's example is collected wrong:

```json
{
  "template": "ENT_1_male and his son ENT_0_male went to look at cars. ENT_1_male ended up buying the Mustang.",
  "rel_comb": "son",
  "gender_comb": "male-male"
}
```

The way the data is defined, `rel_comb` states the explicit relationship between the two entities, such that we can fill in the blanks: "entity 2 is the `rel_comb` of entity 1". Clearly, in this example, `ENT_1_male` is not the `son` of `ENT_0_male`, rather he is the `father` of `ENT_0_male`. This is a case of _role-swapping_.

So what exactly happened here? During data collection, the turker must had exchanged the _order_ of the provided entities and written the story. If we swap `ENT_0_male` and `ENT_1_male` in the above example, the issue is fixed!

Interestingly though, none of the published papers on CLUTRR use this Amazon Mechanical Turk version of templates - they tend to use the basic templated version of the data. Now it is more clear why - the AMT data has issues we need to fix!


## Searching the templates for issues {#searching-the-templates-for-issues}

Now we have an idea of the type of issue that could be present in the data. The next step is the figure out _how many_ templates are affected by this. We have close to 5000 templates, so manually annotating them alone would take a lot of time for me. Thus, I opted for the second best option - writing a Python script to find the errors.

Turns out this is a hard problem - my script needs to run coreference resolution and then perform reliable _relation extraction_ from the collected templates. The problem is even more acute as we collected free-form stories - there is no fixed structure among the templates for easy extraction.

Nevertheless, my first attempt to build a simple pipeline involving a coreference resolver, and subsequent dependency tree extraction failed miserably. I use [spacy](https://spacy.io/usage/linguistic-features) and [coreferee](https://github.com/msg-systems/coreferee) libraries to extract the dependency tree and resolving coreferences. Comparing the predicted relations in the data, this method achieves a mere **34.6%** accuracy!

Surely the AMT templates are not _this_ bad! Time to invest in a better relation extraction pipeline.

Next, I turn to a state-of-the-art relation extractor to do its job. The [OpenNRE project](https://github.com/thunlp/OpenNRE) looked interesting - it is a neural model trained on NYT and Wikipedia datasets. The goal of this project is to perform _implicit_ [relation extraction](https://aclanthology.org/D19-3029.pdf), on multiple relation types. I ran the inference pipeline with `wiki80_bert_softmax` model on the CLUTRR train and test set. This also required a little bit of post-processing, as it always clubs the relations "son" and "daughter" to `child`, and "brother" and "sister" to `sibling`. This should extract the explicit relations easily, right?

Sadly, the relation extractor is only able to get ~30% of the labels correctly, which is even worse than my naive data extractor. Is the problem too complex, or the majority of templates has issues?


## Relation extraction using zero-shot prompting {#relation-extraction-using-zero-shot-prompting}

Over the last couple of weeks, [ChatGPT](https://chat.openai.com/chat) has taken the world by storm given how accurate its responses are! Surely it should be **much** better at extracting relations? I tested a couple of templates out:

{{< figure src="/ox-hugo/chatgpt_clutrr_explicit.png" >}}

It is able to perfectly extract the explicit relation! Heck, it is even able to extract the implicit relation of _aunt_!

{{< figure src="/ox-hugo/chatgpt_clutrr_implicit.png" >}}

It is too bad ChatGPT doesn't have an API to run the relation extractions _en-masse_. But it is clear some form of instruction-tuning would be able to extract the relations with a simple enough prompt. To test my hypothesis, I started with an openly available model - [FlanT5](https://huggingface.co/docs/transformers/model_doc/flan-t5) from [Google](https://arxiv.org/pdf/2210.11416.pdf), which is conveniently available on Huggingface, along with multiple model scales. I used the `flan-t5-xl` model as it is the largest model which fits in my GPU without having to run inference on half precision&nbsp;[^fn:1].

The results are quite good! `flan-t5-xl` gets **74.4%** and **71.6%** correct labels in the train and test splits! This is a more reasonable score, which basically says about 26-29% of the template is either incorrect or too hard for FlanT5 to reason correctly.

How about using a better model? [OpenAI](https://beta.openai.com/) recently released the instruction-finetuned version of [GPT3](https://arxiv.org/abs/2005.14165), `text-davinci-003`. GPT3 is a 175B parameter model, and this recent updated model is fine-tuned over a lot of instruction-oriented datasets so that is has good zero-shot and few-shot capabilities.

Turns out, it does get a little bit better than FlanT5: **77.97%** and **78.47%** on the train and test splits. This further reduces the error range to 21-22%, indicating the remaining templates needs to be analysed for potential annotation issues.


## Error analysis {#error-analysis}

Now, let us dig deeper into the errors, to find what kind of annotation errors are present in the templates. The CLUTRR AMT templates are three types: templates with two entities and one relation, templates with three entities and two relations, and templates with four entities with three relations. We first see the error % in these three buckets:

| Split | Relations | `flan-t5-xl` | `text-davinci-003` |
|-------|-----------|--------------|--------------------|
| Train | 1         | 89.92        | 91.36              |
|       | 2         | 84.86        | 79.76              |
|       | 3         | 57.63        | 68.72              |
| Test  | 1         | 87.5         | 89.74              |
|       | 2         | 83.89        | 85.57              |
|       | 3         | 55.41        | 68.01              |

Not surprisingly, templates with three relations are hardest for the model to extract relations, as the story is long and complicated. Interestingly, this is where GPT3 outperforms FlanT5 by a large margin. However, FlanT5 is able to get better performance in the train set for two relations (with three entities).

Now, to evaluate the errors, I first [manually annotate](https://docs.google.com/spreadsheets/d/1pn1pjLbEmqbaJqm5Ya81DEv7TnYRv3Wl9InbjlxiT2Y/edit?usp=sharing) 127 templates of single relation templates where Flan T5 gets it incorrect. In these, I find only **23%** of templates having annotation errors. Of these, 75% of errors are due to the role swapping. Thus, a majority of the incorrectly classified templates are actually quite hard for the zero shot models to predict, while the rest of them can be either fixed by swapping the relations of the affected entities or dropping them altogether.


## Releasing the GPT3 cleaned data: CLUTRR v1.3 {#releasing-the-gpt3-cleaned-data-clutrr-v1-dot-3}

I'm continually amazed at how far these large language models have progressed in the field, to the point they can perform complex tasks such as relation extraction with ease! Thanks to the instruction-tuned models GPT3 and FlanT5, I do not have to manually annotate thousands of data points. There is a slight possibility of false positives though, which would unfortunately require a full manual annotation with multiple annotators to verify. If you find an error with GPT3 annotated templates, feel free to open a PR to fix that!&nbsp;[^fn:2]

I have been working to streamline the generation process for CLUTRR for a while ([`develop`](https://github.com/facebookresearch/clutrr/tree/develop) branch). To make the generation process faster, the graph generator is now maintained separately in [GLC](https://github.com/koustuvsinha/glc) repository, which is also used by another related project, [GraphLog](https://github.com/facebookresearch/GraphLog). The changes in the AMT templates as described above are now released in [version 1.3](https://github.com/facebookresearch/clutrr/tree/develop), which adds the capability of choosing a subset of AMT templates for application. Additionally, if you wish to skip a specific template from the generation, you can set a flag in the configs during the generation process. I plan to merge the develop branch to main branch once we are ready for version 2.0.


## Roadmap for CLUTRR 2.0 {#roadmap-for-clutrr-2-dot-0}

When we released CLUTRR we were just witnessing the power of large pre-trained models (BERT was released a few months prior). Now, the scenario in NLP has changed drastically with massive language models (GPT3, OPT) demonstrating a suprising ability - the ability to perform "zero-shot" reasoning and to learn "in-context", removing the need to learn the model weights (fine-tuning) on a specific task. This paradigm-shift in training/evaluating models will be a core research area in the coming years, with a renewed focus on _reasoning_. GPT3/ChatGPT, with all its massive number of weights, are still [poor](https://ai.googleblog.com/2022/04/pathways-language-model-palm-scaling-to.html) on arithmetic and logical reasoning.

Thus, it is important to test a models ability on logical reasoning, and also to perform compositional generalization on longer sequences (length generalization). Also, several exciting methods have emerged over the past year ([chain-of-thought](https://arxiv.org/abs/2201.11903) (CoT), [scratchpads](https://arxiv.org/abs/2112.00114v1)) which allow the model to perform better reasoning by providing _explanations_. CLUTRR is well positioned to test these, as CLUTRR v1.3 already supports the generation of intermediate proof steps, which can be useful with these methods to evaluate/train LLMs to perform logical reasoning. In the next major release, CLUTRR 2.0, we would be explicitly developing benchmarks and methods focusing on these areas.&nbsp;[^fn:3] If you would like to be involved or chat more about the possibilities of CLUTRR 2.0, feel free to drop me a mail!

[^fn:1]: For some reason I'm getting way worse results on fp16 with FlanT5. Curious to know why that is the case.
[^fn:2]: The code for the experiments and analysis in this post is available at this [Google Colab File](https://colab.research.google.com/drive/1futiS931teG76OBlwYElMrR4R4ZwjvBu?usp=sharing). The code to run the zero shot experiments are given in this [Github Gist](https://gist.github.com/koustuvsinha/555051d2112fd999ff1159436cadfd07). Data annotations by Flan T5 and GPT3 is [also released here](https://github.com/facebookresearch/clutrr/tree/develop/clutrr/templates/amt) if you want to inspect further.
[^fn:3]: While drafting this blog post I came across this very [relevant preprint](https://arxiv.org/abs/2212.08686), which shows in CLUTRR CoT can be outperformed handsomely by equivalent neuro-symbolic prompting methods.
