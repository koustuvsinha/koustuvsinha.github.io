---
title: "PhD Thesis"
date: 2022-11-02T00:00:00Z
draft: false
summary: "Exploring the limits of systematicity of natural language understanding models"
authors: ["McGill University, Defense Date: November 2nd, 2022, Mode: Virtual"]
tags: ["phd-thesis"]
categories: []

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Custom links (optional).
#   Uncomment and edit lines below to show custom links.
# links:
# - name: Follow
#   url: https://twitter.com
#   icon_pack: fab
#   icon: twitter

url_slides: "/uploads/phd_defense_slides.pdf"
url_pdf: ""


# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

<div class="ox-hugo-toc toc">

<div class="heading">Table of Contents</div>

- [Thesis Committee](#thesis-committee)
- [Thesis Title](#thesis-title)
- [Abstract](#abstract)
- [Thesis Document](#thesis-document)
- [Papers used in the Thesis](#papers-used-in-the-thesis)
- [Acknowledgements](#acknowledgements)
- [Pictures](#pictures)

</div>
<!--endtoc-->

On November 2nd, 2022 I defended my PhD thesis successfully in front of a virtual audience. Following are the details of the thesis, committee, and a sincere acknowledgement to all of whom who have influenced, encouraged, helped and supported me throughout this epic journey!


## Thesis Committee {#thesis-committee}

-   Dr. Yue Li (Chair)
-   Dr. Joelle Pineau (Supervisor)
-   Dr. Timothy J O'Donell (Supervisory Committee)
-   Dr. Dima Bahdanau (Internal Member)
-   Dr. Kyunghyun Cho (NYU) (External Member)


## Thesis Title {#thesis-title}

"Exploring the limits of systematicity of natural language understanding models"


## Abstract {#abstract}

In this thesis, we investigate several approaches to evaluate modern neural
language models through the lens of systematicity, in order to assess their
human-level reasoning and comprehension of natural language. First, we
investigate the model's limits in encoding the natural language semantics by
proposing a diagnostic challenge dataset known as CLUTRR. Drawing inspiration
from first-order logic, this dataset specifically tests for systematicity in
length generalization in natural language understanding models, in the form of a
question-answering task. We observe most major models fail in generalizing to
longer chain of reasoning, with the main limitation arising from their
rudimentary understanding of syntax. Next, we apply the principles of
systematicity to evaluate the syntax encoding strategy of large language models
by applying permutations to the word order seen during inference and training.
We observe a surprising fact that a trained neural language model can still
perform optimally when subjected to sentences of shuffled word orders, devoid of their original meaning, and furthermore they can even improve their performance
significantly on specific permutations. Next, we investigate the reasons of such
behavior by pre-training large language models on meaningless, word-order
shuffled corpora, to find they too behave optimally on downstream semantic and
syntactic tasks. These results highlight the potential distributional nature of large language models, such that they only focus on n-grams during computation. Finally, we attempt to investigate the root cause of these effects, to find the component of the model most responsible. We observe that certain classes of position embeddings lead the models to overfit on the token positions, subjecting models to exhibit un-systematic behavior on out-of-position sentences. In summary, this thesis attempts to shed more light to the black box nature of the state-of-the-art neural language models, and introduces mechanisms to test and ensure systematic behaviors in their understanding of natural language.


## Thesis Document {#thesis-document}

_(To be updated post publication from McGill)_


## Papers used in the Thesis {#papers-used-in-the-thesis}

-   Koustuv Sinha, Shagun Sodhani, Jin Dong, Joelle Pineau, and William L. Hamilton. 2019. [CLUTRR: A Diagnostic Benchmark for Inductive Reasoning from Text.](https://aclanthology.org/D19-1458/) In Proceedings of the 2019 Conference on Empirical Methods in Natural Language Processing and the 9th International Joint Conference on Natural Language Processing (EMNLP-IJCNLP), pages 4506–4515, Hong Kong, China. Association for Computational Linguistics.
-   Koustuv Sinha, Prasanna Parthasarathi, Joelle Pineau, and Adina Williams. 2021. [UnNatural Language Inference.](https://aclanthology.org/2021.acl-long.569/) In Proceedings of the 59th Annual Meeting of the Association for Computational Linguistics and the 11th International Joint Conference on Natural Language Processing (Volume 1: Long Papers), pages 7329–7346, Online. Association for Computational Linguistics.
-   Koustuv Sinha, Robin Jia, Dieuwke Hupkes, Joelle Pineau, Adina Williams, and Douwe Kiela. 2021. [Masked Language Modeling and the Distributional Hypothesis: Order Word Matters Pre-training for Little.](https://aclanthology.org/2021.emnlp-main.230/) In Proceedings of the 2021 Conference on Empirical Methods in Natural Language Processing, pages 2888–2913, Online and Punta Cana, Dominican Republic. Association for Computational Linguistics.
-   Koustuv Sinha, Amirhossein Kazemnejad, Siva Reddy, Joelle Pineau, Dieuwke Hupkes, and Adina Williams, 2022. [The Curious Case of Absolute Position Embeddings.](https://arxiv.org/abs/2210.12574) In Proceedings of the Findings of 2022 Empirical Methods in Natural Language Processing, Abu Dhabi. Association of Computational Linguistics.


## Acknowledgements {#acknowledgements}

First and foremost, I would like to thank my supervisor, Joelle Pineau, for her endless support, motivation and guidance; being an incredibly patient mentor and role model for conducting scientific research; involving me in the quest to achieve reproducibility in machine learning; and continually providing me opportunities to learn and grow during my PhD. I consider myself incredibly lucky to have such a kind and enthusiastic mentor in my life.

I would like to thank my close collaborators Adina Williams, Shagun Sodhani and Prasanna Parthasarthi for their guidance, endless support and motivation throughout many projects that are included in this thesis or otherwise. Furthermore, I would like to thank my incredible mentors with whom I have been fortunate enough to collaborate and learn how to conduct thorough scientific research during my thesis: William L. Hamilton, Dieuwke Hupkes, Douwe Kiela, Robin Jia, Timothy O'Donnell and Adi Renduchintala. Furthermore, I would like to thank my professors in the RL Lab and beyond, who have helped me foster my research interests in natural language processing: Siva Reddy, Jackie Cheung, Dima Bahdanau, Derek Ruths and Andrew Piper.

I'd also like to thank my collaborators and co-authors for their help and support for the research materials involved in this thesis and related works: Amirhossein Kazemnejad, Jin Dong, Emily Goodwin, Nicolas Gontier, Ryan Lowe and Jasmine Wang.

My life in Montreal started back in 2016 with my Masters, then followed by my PhD. In the last six years, I am lucky and grateful to all my friends who made my life away from home feel like home, including: Sumana Basu, Upasana Dasgupta, Haji Mohammad Saleem, Shagun Sodhani, Sayantan Datta, Arna Ghosh, Haque Ishfaq, Attia Amin Oni, Matt Gittings from McGill University, Nicolas Gontier, Harsh Satija, Jad Kabbara, Malik Altrakrori, Kushal Arora, Khimya Khetarpal, Charles Onu, Lucas Caccia, Joey Bose, Arushi Jain, Ayush Jain, Jonathan Lebensold, Maxime Wabartha, Emmanuel Bengio, Yue Dong, Audrey Durand, Nadeem Ward, Riashat Islam and the entire RL Lab/Mila, and all my friends from my Masters, including Peter Henderson, Caitrin Armstrong, Deven Patel, Ramchalam K. Ramakrishnan and Jaspal Singh, all of whom who have a special place in my heart.

I fondly recall my time at Samsung Advanced Institute of Technology, Korea where I did my first internship of my PhD. A special thank you to all at SAIT for making my time at Korea something to cherish and fondly remember for years to come, including Young Sang Choi, Sanghyun Yoo, Jehun Jeon, Ki Soo, Park Jong Hun and the entire Language Technologies team.

During my PhD I spent significant time being an intern at Meta AI Montreal. I'd like to thank all my colleagues who made those days enjoyable and fruitful in both research and life experiences: Shagun Sodhani, Vinayak Tantia, Mike Rabbat, Daniella Kafla, Adriana Romero, Michal Drozdzal and many others. A special shoutout to the security and culinary teams at Meta Montreal for keeping me company during late night sessions and providing an unforgettable culinary experience. I'd also like to thank all my colleagues in Meta AI who have provided technical guidance and support throughout my internship, including Jack Urbaneck, Emily Dinan, Shruti Bhosale, Shubho Sengupta and many others.

This thesis consists of experiments which required a significant amount of compute. Thus, I would like to thank the teams at McGill, Mila, Meta and Compute Canada responsible for maintaining the compute clusters and providing us a seamless experience to run countless experiments on demand. In particular, I would like to thank Ron Simpson, Andrew Bogecho, Corey Barton Antoniuk from McGill; Olexa Bilaniuk, Bruno Travouillon, Ahmed Mamlouk, Frederic Osterrath and the entire Mila IDT team; and the Penguin Compute Team from Meta for providing extensive technical support and assistance during the experiments conducted in this thesis.

Over the course of my PhD I was actively involved in leading the annual Machine Learning Reproducibility Challenge, which would not have been possible without the constant support, motivation and guidance of my co-organizers: Jessica Forde, Jesse Dodge, Sasha Luccioni, Robert Stojnic, Sharath Raparthy and Joelle Pineau; Nicolas Rougier from ReScience and the OpenReview team for providing the technical support.

The Covid pandemic occurred during my PhD, which led to an exciting opportunity to contribute towards understanding the disease in a data-driven way, thanks to my supervisor Joelle Pineau. I would like to thank my colleagues from Meta AI, Matthew Muckley and Anuroop Sriram, with whom I worked closely during this period to develop chest X-ray imaging pipelines, and who helped me develop an alternate research interest in medical imaging and taught me to conduct rigorous scientific studies.

I would like also to extend by sincere thanks and gratitude to the incredible professors and mentors I had during my pre-Masters days in India, who helped nurture my interest in computer science research, including Ee-Kian Wong, Saptarsi Goswami, Sukalyan Goswami, Tamal Chakraborty, Nilanjana Dutta Roy from Institute of Engineering &amp; Management, Kolkata; Koumudi Patil and Arnab Bhattacharya from Indian Institute of Technology, Kanpur; and Debjit Chakraborty from Ramakrishna Mission Vidyalaya, Narendrapur.

I am grateful to have long standing relationships with my childhood friends from school and undergrad, who despite being physically located miles apart check on me from time-to-time to ensure my mental health is okay: Anikendu Bose, Pamela Roy, Sounak Mohanta, Debojyoti Roy Malakar, Subhodeep Santra, Anindya Chatterjee, Nilanjan Roy, Aritra Chatterjee, Soumalyo Sarkar, Abhishek Rudra and many wonderful people at Ramakrishna Mission Vidyalaya, Narendrapur and Institute of Engineering &amp; Management, Kolkata.

Finally, I grateful to my family for being there through thick and thin, cheering for me and supporting me even though multiple continents separate us, including my parents, _Ma_ (Supriya Sinha), _Baba_ (Kanchan Kumar Sinha), my sister _June_ (Adrija Sinha), my in-laws _Maa_ (Sanchita Basu), _Bapi_ (Manas Basu), _Didibhai_ (Arati Basu), brother-in-law _Jerry_ (Ananda Basu) and especially my wife, Atrayee Basu. My wife gets a special acknowledgement, for loving me more than I deserve, for constantly supporting, encouraging and motivating me, and for being my constant source of inspiration, when we are together, and even when we are apart. Love you all!


## Pictures {#pictures}

Unfortunately I missed the opportunity to get a screen capture during my defense, but my wife made sure to get some snaps during my talk! :)

{{< figure src="/ox-hugo/phd_thesis_snap_1.jpg" >}}

{{< figure src="/ox-hugo/phd_thesis_snap_2.jpg" >}}
