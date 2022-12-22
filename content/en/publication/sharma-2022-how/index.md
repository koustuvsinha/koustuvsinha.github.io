---
# Documentation: https://wowchemy.com/docs/managing-content/

title:
  How sensitive are translation systems to extra contexts? Mitigating gender
  bias in Neural Machine Translation models through relevant contexts
subtitle: ""
summary: ""
authors:
  - Shanya Sharma
  - Manan Dey
  - Koustuv Sinha
tags:
  - Computation and Language (cs.CL)
  - Machine Learning (cs.LG)
  - "FOS: Computer and information sciences"
  - "FOS: Computer and information sciences"
  - I.2.7
  - 68T50
categories: []
date: "2022-01-01"
lastmod: 2022-07-18T19:57:58-04:00
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
publishDate: "2022-07-18T23:57:58.726792Z"
publication_types:
  - "1"
abstract:
  Neural Machine Translation systems built on top of Transformer-based architectures
  are routinely improving the state-of-the-art in translation quality according to
  word-overlap metrics. However, a growing number of studies also highlight the inherent
  gender bias that these models incorporate during training, which reflects poorly
  in their translations. In this work, we investigate whether these models can be
  instructed to fix their bias during inference using targeted, guided instructions
  as contexts. By translating relevant contextual sentences during inference along
  with the input, we observe large improvements in reducing the gender bias in translations,
  across three popular test suites (WinoMT, BUG, SimpleGen). We further propose a
  novel metric to assess several large pretrained models (OPUS-MT, M2M-100) on their
  sensitivity towards using contexts during translation to correct their biases. Our
  approach requires no fine-tuning, and thus can be used easily in production systems
  to de-bias translations from stereotypical gender-occupation bias. We hope our method,
  along with our metric, can be used to build better, bias-free translation systems.
publication: "*Findings of Empirical Methods of Natural Language Processing (EMNLP), 2022*"
doi: 10.48550/ARXIV.2205.10762
links:
  - name: Arxiv
    url: https://arxiv.org/abs/2205.10762
---
