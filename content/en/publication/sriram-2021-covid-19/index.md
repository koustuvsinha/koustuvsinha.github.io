---
# Documentation: https://wowchemy.com/docs/managing-content/

title: COVID-19 Deterioration Prediction via Self-Supervised Representation Learning
  and Multi-Image Prediction
subtitle: ''
summary: ''
authors:
- Anuroop Sriram
- Matthew Muckley
- Koustuv Sinha
- Farah Shamout
- Joelle Pineau
- Krzysztof J. Geras
- Lea Azour
- Yindalon Aphinyanaphongs
- Nafissa Yakubova
- William Moore
tags: []
categories: []
date: '2021-01-01'
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
publishDate: '2022-07-18T23:57:59.881715Z'
publication_types:
- '2'
abstract: 'The rapid spread of COVID-19 cases in recent months has strained hospital
  resources, making rapid and accurate triage of patients presenting to emergency
  departments a necessity. Machine learning techniques using clinical data such as
  chest X-rays have been used to predict which patients are most at risk of deterioration.
  We consider the task of predicting two types of patient deterioration based on chest
  X-rays: adverse event deterioration (i.e., transfer to the intensive care unit,
  intubation, or mortality) and increased oxygen requirements beyond 6 L per day.
  Due to the relative scarcity of COVID-19 patient data, existing solutions leverage
  supervised pretraining on related non-COVID images, but this is limited by the differences
  between the pretraining data and the target COVID-19 patient data. In this paper,
  we use self-supervised learning based on the momentum contrast (MoCo) method in
  the pretraining phase to learn more general image representations to use for downstream
  tasks. We present three results. The first is deterioration prediction from a single
  image, where our model achieves an area under receiver operating characteristic
  curve (AUC) of 0.742 for predicting an adverse event within 96 hours (compared to
  0.703 with supervised pretraining) and an AUC of 0.765 for predicting oxygen requirements
  greater than 6 L a day at 24 hours (compared to 0.749 with supervised pretraining).
  We then propose a new transformer-based architecture that can process sequences
  of multiple images for prediction and show that this model can achieve an improved
  AUC of 0.786 for predicting an adverse event at 96 hours and an AUC of 0.848 for
  predicting mortalities at 96 hours. A small pilot clinical study suggested that
  the prediction accuracy of our model is comparable to that of experienced radiologists
  analyzing the same information.'
publication: ''
links:
- name: Arxiv
  url: http://arxiv.org/abs/2101.04909
- name: Code
  url: https://github.com/facebookresearch/CovidPrognosis
---
