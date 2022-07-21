---
title: "GraphLog"
date: 2020-08-01T00:00:00Z
draft: false
summary: "GraphLog is a multi-purpose, multi-relational graph dataset built using rules grounded in first-order logic."
authors: []
tags: []
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

url_code: "https://github.com/facebookresearch/GraphLog"
url_pdf: "https://arxiv.org/pdf/2003.06560.pdf"
url_slides: ""
url_video: "https://www.youtube.com/watch?v=TKEjaA4m4jg"
url_slack: "https://join.slack.com/t/logicalml/shared_invite/zt-e7osm7j7-vfIRgJAbEHxYN5D70njvyw"
url_blog: ""
url_docs: "https://graphlog.readthedocs.io/en/latest/"

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

_Koustuv Sinha, Shagun Sodhani, Joelle Pineau, William L. Hamilton_

**Abstract**

Recent research has highlighted the role of relational inductive biases
in building learning agents that can generalize and reason in a
compositional manner. However, while relational learning algorithms such as graph neural networks (GNNs) show promise, we do not understand how effectively these approaches can adapt to new tasks. In this work, we
study the task of _logical generalization_ using GNNs by designing a
benchmark suite grounded in first-order logic. Our benchmark suite,
**`GraphLog`**, requires that learning algorithms perform rule induction
in different synthetic logics, represented as knowledge graphs.
**`GraphLog`** consists of relation prediction tasks on 57 distinct
logical domains. We use **`GraphLog`** to evaluate GNNs in three different
setups: single-task supervised learning, multi-task pretraining, and
continual learning. Unlike previous benchmarks, our approach allows us
to precisely control the logical relationship between the different
tasks. We find that the ability for models to generalize and adapt is
strongly determined by the diversity of the logical rules they encounter
during training, and our results highlight new challenges for the design
of GNN models.


## Latest News {#news}

-   **May 24, 2020** : Code for experiments in the paper released in [GraphLog repository](https://github.com/facebookresearch/GraphLog/tree/master/experiments)
-   **April 25, 2020** : Added simple [supervised experiments](https://github.com/facebookresearch/GraphLog/tree/master/examples) using GraphLog in [Pytorch Lightning](https://pytorch-lightning.readthedocs.io/en/latest/)
