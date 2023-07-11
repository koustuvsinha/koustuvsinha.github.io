---
# Documentation: https://wowchemy.com/docs/managing-content/

title: Language model acceptability judgements are not always robust to context
subtitle: ""
summary: ""
authors:
  - Koustuv Sinha
  - Jon Gauthier
  - Aaron Mueller
  - Kanishka Misra
  - Keren Fuentes
  - Roger Levy
  - Adina Williams
tags: []
categories: []
date: "2023-07-01"
lastmod: 2023-07-11T14:36:27-04:00
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
publishDate: "2023-07-11T18:36:06.007751Z"
publication_types:
  - "1"
abstract:
  "Targeted syntactic evaluations of language models ask whether models show
  stable preferences for syntactically acceptable content over minimal-pair unacceptable
  inputs. Our best syntactic evaluation datasets, however, provide substantially less
  linguistic context than models receive during pretraining. This mismatch raises
  an important question: how robust are models′ syntactic judgements across different
  contexts? In this paper, we vary the input contexts based on: length, the types
  of syntactic phenomena it contains, and whether or not there are grammatical violations.
  We find that model judgements are generally robust when placed in randomly sampled
  linguistic contexts, but are unstable when contexts match the test stimuli in syntactic
  structure. Among all tested models (GPT-2 and five variants of OPT), we find that
  model performance is affected when we provided contexts with matching syntactic
  structure: performance significantly improves when contexts are acceptable, and
  it significantly declines when they are unacceptable. This effect is amplified by
  the length of the context, except for unrelated inputs. We show that these changes
  in model performance are not explainable by acceptability-preserving syntactic perturbations.
  This sensitivity to highly specific syntactic features of the context can only be
  explained by the models′ implicit in-context learning abilities."
publication: "*Proceedings of the 61st Annual Meeting of the Association for Computational Linguistics (Volume 1: Long Papers)*, **Outstanding Paper Award**"
links:
  - name: Arxiv
    url: https://arxiv.org/abs/2212.08979
  - name: ACL Anthology
    url: https://aclanthology.org/2023.acl-long.333
---
