---
title: "CLUTRR"
date: 2019-09-07T00:00:00Z
draft: false
summary: "A Diagnostic Benchmark for Inductive Reasoning from Text"
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

url_code: "https://github.com/facebookresearch/clutrr"
url_pdf: "https://arxiv.org/pdf/1908.06177.pdf"
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

A Diagnostic Benchmark for Inductive Reasoning from Text.

_Koustuv Sinha, Shagun Sodhani, Jin Dong, Joelle Pineau, William L. Hamilton_


## Abstract {#abstract}

The recent success of natural language understanding (NLU) systems has been troubled by results highlighting the failure of these models to generalize in a systematic and robust way. In this work, we introduce a diagnostic benchmark suite, named CLUTRR, to clarify some key issues related to the robustness and systematicity of NLU systems. Motivated by classic work on inductive logic programming, CLUTRR requires that an NLU system infer kinship relations between characters in short stories. Successful performance on this task requires both extracting relationships between entities, as well as inferring the logical rules governing these relationships. CLUTRR allows us to precisely measure a model’s ability for systematic generalization by evaluating on held-out combinations of logical rules, and it allows us to evaluate a model’s robustness by adding curated noise facts. Our empirical results highlight a substantial performance gap between state-of-the-art NLU models (e.g., BERT and MAC) and a graph neural network model that works directly with symbolic inputs—with the graph-based model exhibiting both stronger generalization and greater robustness.
