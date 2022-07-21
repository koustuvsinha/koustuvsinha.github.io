---
# Documentation: https://wowchemy.com/docs/managing-content/

title: Measuring Systematic Generalization in Neural Proof Generation with Transformers
subtitle: ''
summary: ''
authors:
- Nicolas Gontier
- Koustuv Sinha
- Siva Reddy
- Christopher Pal
tags: []
categories: []
date: '2020-01-01'
lastmod: 2022-07-18T19:57:58-04:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ''
  focal_point: ''
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
publishDate: '2022-07-18T23:57:58.009984Z'
publication_types:
- '1'
abstract: 'We are interested in understanding how well Transformer language models
  (TLMs) can perform reasoning tasks when trained on knowledge encoded in the form
  of natural language. We investigate systematic generalization abilities on an inductive
  logical reasoning task in natural language, which involves reasoning over relationships
  between entities grounded in first-order logical proofs. Specifically, we perform
  soft theorem-proving by leveraging TLMs to generate logical proofs represented in
  natural language. We systematically test proof generation capabilities, along with
  inference capabilities leveraging the generated proofs. We observe length-generalization
  issues in proof generation and inference when evaluated on longer-than-trained sequences.
  However, we observe TLMs improve their generalization performance after being exposed
  to longer, exhaustive proofs. In addition, we discover that TLMs are able to generalize
  better using backward-chaining proofs compared to their forward-chaining counterparts,
  while they find it easier to generate forward chaining proofs. We observe that models
  that are not trained to generate proofs are better at generalizing to problems based
  on longer proofs. This result suggests that Transformers have efficient, yet not
  interpretable reasoning strategies internally. These results also highlight the
  systematic generalization issues in TLMs in the context of logical reasoning, and
  we believe this work will motivate deeper inspection of their underlying reasoning
  strategies. '
publication: '*Neural Information Procesing Systems (NeurIPS)*'
links:
- name: Arxiv
  url: https://arxiv.org/abs/2009.14786
- name: NeurIPS
  url: https://proceedings.neurips.cc/paper/2020/hash/fc84ad56f9f547eb89c72b9bac209312-Abstract.html
- name: Code
  url: https://github.com/NicolasAG/SGinPG
---
