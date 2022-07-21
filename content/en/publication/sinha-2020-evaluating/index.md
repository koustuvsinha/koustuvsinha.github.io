---
# Documentation: https://wowchemy.com/docs/managing-content/

title: Evaluating Logical Generalization in Graph Neural Networks
subtitle: ''
summary: ''
authors:
- Koustuv Sinha
- Shagun Sodhani
- Joelle Pineau
- William L Hamilton
tags: []
categories: []
date: '2020-01-01'
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
publishDate: '2022-07-18T23:57:59.058866Z'
publication_types:
abstract: 'Recent research has highlighted the role of relational inductive biases
  in building learning agents that can generalize and reason in a compositional manner.
  However, while relational learning algorithms such as graph neural networks (GNNs)
  show promise, we do not understand how effectively these approaches can adapt to
  new tasks. In this work, we study the task of logical generalization using GNNs
  by designing a benchmark suite grounded in first-order logic. Our benchmark suite,
  GraphLog, requires that learning algorithms perform rule induction in different
  synthetic logics, represented as knowledge graphs. GraphLog consists of relation
  prediction tasks on 57 distinct logical domains. We use GraphLog to evaluate GNNs
  in three different setups: single-task supervised learning, multi-task pretraining,
  and continual learning. Unlike previous benchmarks, our approach allows us to precisely
  control the logical relationship between the different tasks. We find that the ability
  for models to generalize and adapt is strongly determined by the diversity of the
  logical rules they encounter during training, and our results highlight new challenges
  for the design of GNN models.'
publication: '*arXiv preprint arXiv:2003.06560*'
links:
- name: Arxiv
  url: https://arxiv.org/abs/2003.06560
- name: Code 
  url: https://github.com/facebookresearch/graphlog
---
