---
# Documentation: https://wowchemy.com/docs/managing-content/

title: 'CLUTRR: A Diagnostic Benchmark for Inductive Reasoning from Text'
subtitle: ''
summary: ''
authors:
- Koustuv Sinha
- Shagun Sodhani
- Jin Dong
- Joelle Pineau
- William L. Hamilton
tags: []
categories: []
date: '2019-01-01'
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
publishDate: '2022-07-18T23:57:58.973811Z'
publication_types:
- '1'
abstract: "The recent success of natural language understanding (NLU) systems has\
  \ been troubled by results highlighting the failure of these models to generalize\
  \ in a systematic and robust way. In this work, we introduce a diagnostic benchmark\
  \ suite, named CLUTRR, to clarify some key issues related to the robustness and\
  \ systematicity of NLU systems. Motivated by classic work on inductive logic programming,\
  \ CLUTRR requires that an NLU system infer kinship relations between characters\
  \ in short stories. Successful performance on this task requires both extracting\
  \ relationships between entities, as well as inferring the logical rules governing\
  \ these relationships. CLUTRR allows us to precisely measure a model's ability for\
  \ systematic generalization by evaluating on held-out combinations of logical rules,\
  \ and it allows us to evaluate a model's robustness by adding curated noise facts.\
  \ Our empirical results highlight a substantial performance gap between state-of-the-art\
  \ NLU models (e.g., BERT and MAC) and a graph neural network model that works directly\
  \ with symbolic inputs---with the graph-based model exhibiting both stronger generalization\
  \ and greater robustness. "
publication: '*Empirical Methods of Natural Language Processing (EMNLP)*, <u>Oral</u>'
links:
- name: Arxiv
  url: https://arxiv.org/abs/1908.06177
- name: ACL Anthology
  url: https://aclanthology.org/D19-1458/
- name: Code
  url: https://github.com/facebookresearch/clutrr
---
