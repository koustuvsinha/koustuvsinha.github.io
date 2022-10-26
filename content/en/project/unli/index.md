---
title: "UnNatural Language Inference"
date: 2021-07-01T00:00:00Z
draft: false
summary: "NLU models tend to 'understand' word scrambled sentences! (ACL 2021 Long Paper)"
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

url_code: "https://github.com/facebookresearch/unlu"
url_pdf: "https://arxiv.org/abs/2101.00010"
url_slides: "https://github.com/koustuvsinha/koustuvsinha.github.io/blob/jekyll/assets/files/unli_acl_talk.pdf"
url_video: "https://youtu.be/oAM0Sr1WNW0"
# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

**Abstract**

Recent investigations into the inner-workings of state-of-the-art
large-scale pre-trained Transformer-based Natural Language Understanding
(NLU) models indicate that they appear to understand human-like syntax,
at least to some extent. We provide novel evidence that complicates this
claim: we find that state-of-the-art Natural Language Inference (NLI)
models assign the same labels to permuted examples as they do to the
original, i.e. they are invariant to random word-order permutations.
This behavior notably differs from that of humans; we struggle to
understand the meaning of ungrammatical sentences. To measure the
severity of this issue, we propose a suite of metrics and investigate
which properties of particular permutations lead models to be word order
invariant. For example, in MNLI dataset we find almost all (98.7%)
examples contain at least one permutation which elicits the gold label.
Models are even able to assign gold labels to permutations that they
originally failed to predict correctly. We provide a comprehensive
empirical evaluation of this phenomenon, and further show that this
issue exists in pre-Transformer RNN / ConvNet based encoders, as well as
across multiple languages (English and Chinese). Our code and data are
available at <https://github.com/facebookresearch/unlu>.

{{< figure src="/ox-hugo/anim_30.gif" >}}


## Latest News {#news}

-   **July 3, 2021** : We are honored to be awarded [Outstanding Paper Award](https://2021.aclweb.org/program/accept/) in ACL-IJCNLP 2021!
