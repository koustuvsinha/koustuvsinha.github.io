---
# Documentation: https://wowchemy.com/docs/managing-content/

title: 'Masked Language Modeling and the Distributional Hypothesis: Order Word Matters
  Pre-training for Little'
subtitle: ''
summary: ''
authors:
- Koustuv Sinha
- Robin Jia
- Dieuwke Hupkes
- Joelle Pineau
- Adina Williams
- Douwe Kiela
tags: []
categories: []
date: '2021-07-01'
lastmod: 2022-07-18T19:57:59-04:00
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
publishDate: '2022-07-18T23:57:59.485338Z'
publication_types:
- '1'
abstract: 'A possible explanation for the impressive performance of masked language
  model (MLM) pre-training is that such models have learned to represent the syntactic
  structures prevalent in classical NLP pipelines. In this paper, we propose a different
  explanation: MLMs succeed on downstream tasks almost entirely due to their ability
  to model higher-order word co-occurrence statistics. To demonstrate this, we pre-train
  MLMs on sentences with randomly shuffled word order, and show that these models
  still achieve high accuracy after fine-tuning on many downstream tasks -- including
  on tasks specifically designed to be challenging for models that ignore word order.
  Our models perform surprisingly well according to some parametric syntactic probes,
  indicating possible deficiencies in how we test representations for syntactic information.
  Overall, our results show that purely distributional information largely explains
  the success of pre-training, and underscore the importance of curating challenging
  evaluation datasets that require deeper linguistic knowledge.'
publication: '*Empirical Methods of Natural Language Processing (EMNLP)*'
links:
- name: Arxiv
  url: https://arxiv.org/abs/2104.06644
- name: ACL Anthology
  url: https://aclanthology.org/2021.emnlp-main.230/
- name: Code
  url: https://github.com/pytorch/fairseq/tree/master/examples/shuffled_word_order
---
