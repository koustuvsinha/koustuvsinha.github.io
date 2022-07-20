---
# Documentation: https://wowchemy.com/docs/managing-content/

title: Sometimes We Want Ungrammatical Translations
subtitle: ''
summary: ''
authors:
- Prasanna Parthasarathi
- Koustuv Sinha
- Joelle Pineau
- Adina Williams
tags: []
categories: []
date: '2021-01-01'
lastmod: 2022-07-18T19:57:58-04:00
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
publishDate: '2022-07-18T23:57:58.454585Z'
publication_types:
- '1'
abstract: 'Rapid progress in Neural Machine Translation (NMT) systems over the last
  few years has been driven primarily towards improving translation quality, and as
  a secondary focus, improved robustness to input perturbations (e.g. spelling and
  grammatical mistakes). While performance and robustness are important objectives,
  by over-focusing on these, we risk overlooking other important properties. In this
  paper, we draw attention to the fact that for some applications, faithfulness to
  the original (input) text is important to preserve, even if it means introducing
  unusual language patterns in the (output) translation. We propose a simple, novel
  way to quantify whether an NMT system exhibits robustness and faithfulness, focusing
  on the case of word-order perturbations. We explore a suite of functions to perturb
  the word order of source sentences without deleting or injecting tokens, and measure
  the effects on the target side in terms of both robustness and faithfulness. Across
  several experimental conditions, we observe a strong tendency towards robustness
  rather than faithfulness. These results allow us to better understand the trade-off
  between faithfulness and robustness in NMT, and opens up the possibility of developing
  systems where users have more autonomy and control in selecting which property is
  best suited for their use case. '
publication: '*Empirical Methods of Natural Language Processing (EMNLP) Findings*'
links:
- name: ACL Anthology
  url: https://aclanthology.org/2021.findings-emnlp.275/
---
