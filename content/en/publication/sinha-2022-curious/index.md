---
# Documentation: https://wowchemy.com/docs/managing-content/

title: The Curious Case of Absolute Position Embeddings
subtitle: ""
summary: ""
authors:
  - Koustuv Sinha
  - Amirhossein Kazemnejad
  - Siva Reddy
  - Joelle Pineau
  - Dieuwke Hupkes
  - Adina Williams
tags: []
categories: []
date: "2022-12-07"
lastmod: 2022-12-21T21:19:52-05:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
publishDate: "2022-12-22T02:19:46.599641Z"
publication_types:
  - "1"
abstract: "Transformer language models encode the notion of word order using positional information. Most commonly, this positional information is represented by absolute position embeddings (APEs), that are learned from the pretraining data. However, in natural language, it is not absolute position that matters, but relative position, and the extent to which APEs can capture this type of information has not been investigated. In this work, we observe that models trained with APE over-rely on positional information to the point that they break-down when subjected to sentences with shifted position information. Specifically, when models are subjected to sentences starting from a non-zero position (excluding the effect of priming), they exhibit noticeably degraded performance on zero to full-shot tasks, across a range of model families and model sizes. Our findings raise questions about the efficacy of APEs to model the relativity of position information, and invite further introspection on the sentence and word order processing strategies employed by these models."
publication: "*Findings of Empirical Methods of Natural Language Processing*"
doi: 10.48550/arXiv.2210.12574
links:
  - name: Arxiv
    url: https://arxiv.org/abs/2210.12574
---
