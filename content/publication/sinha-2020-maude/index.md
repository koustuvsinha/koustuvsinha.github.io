---
# Documentation: https://wowchemy.com/docs/managing-content/

title: Learning an Unreferenced Metric for Online Dialogue Evaluation
subtitle: ''
summary: ''
authors:
- Koustuv Sinha
- Prasanna Parthasarathi
- Jasmine Wang
- Ryan Lowe
- William L. Hamilton
- Joelle Pineau
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
publishDate: '2022-07-18T23:57:59.165481Z'
publication_types:
- '1'
abstract: Evaluating the quality of a dialogue interaction between two agents is a
  difficult task, especially in open-domain chit-chat style dialogue. There have been
  recent efforts to develop automatic dialogue evaluation metrics, but most of them
  do not generalize to unseen datasets and/or need a human-generated reference response
  during inference, making it infeasible for online evaluation. Here, we propose an
  unreferenced automated evaluation metric that uses large pre-trained language models
  to extract latent representations of utterances, and leverages the temporal transitions
  that exist between them. We show that our model achieves higher correlation with
  human annotations in an online setting, while not requiring true responses for comparison
  during inference.
publication: '*Association of Computational Linguistics (ACL)*'
links:
- name: Arxiv
  url: https://arxiv.org/abs/2005.00583
- name: ACL Anthology
  url: https://aclanthology.org/2020.acl-main.220/
- name: Code
  url: https://github.com/facebookresearch/online_dialog_eval
---
