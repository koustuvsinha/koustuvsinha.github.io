---
# Documentation: https://wowchemy.com/docs/managing-content/

title: UnNatural Language Inference
subtitle: ''
summary: ''
authors:
- Koustuv Sinha
- Prasanna Parthasarathi
- Joelle Pineau
- Adina Williams
tags: []
categories: []
date: '2021-03-01'
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
publishDate: '2022-07-18T23:57:59.695221Z'
publication_types:
- '1'
abstract: "Natural Language Understanding has witnessed a watershed moment with the\
  \ introduction of large pre-trained Transformer networks. These models achieve state-of-the-art\
  \ on various tasks, notably including Natural Language Inference (NLI). Many studies\
  \ have shown that the large representation space imbibed by the models encodes some\
  \ syntactic and semantic information. However, to really ``know syntax'', a model\
  \ must recognize when its input violates syntactic rules and calculate inferences\
  \ accordingly. In this work, we find that state-of-the-art NLI models, such as RoBERTa\
  \ and BART are invariant to, and sometimes even perform better on, examples with\
  \ randomly reordered words. With iterative search, we are able to construct randomized\
  \ versions of NLI test sets, which contain permuted hypothesis-premise pairs with\
  \ the same words as the original, yet are classified with perfect accuracy by large\
  \ pre-trained models, as well as pre-Transformer state-of-the-art encoders. We find\
  \ the issue to be language and model invariant, and hence investigate the root cause.\
  \ To partially alleviate this effect, we propose a simple training methodology.\
  \ Our findings call into question the idea that our natural language understanding\
  \ models, and the tasks used for measuring their progress, genuinely require a human-like\
  \ understanding of syntax. "
publication: '*Association of Computational Linguistics (ACL)*, <u>Oral</u>, **Outstanding Paper Award**'
links:
- name: Arxiv
  url: https://arxiv.org/abs/2101.00010
- name: ACL Anthology
  url: https://aclanthology.org/2021.acl-long.569/
- name: Code
  url: https://github.com/facebookresearch/unlu
---
