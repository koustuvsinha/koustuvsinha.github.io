---
layout: page
title: GraphLog
description: GraphLog is a multi-purpose, multi-relational graph dataset built using rules grounded in first-order logic.
authors: Koustuv Sinha, Shagun Sodhani, Joelle Pineau, William L. Hamilton
permalink: /graphlog/
img: /assets/img/graphlog.png
date: 2020-02-15 12:00:00
---

<img src="{{ '/assets/img/graphlog.png' | prepend: site.baseurl | prepend: site.url }}" alt="graphlog" width="500"/>

**Coming Soon!** : [Paper](), [Dataset](),  [Code](), [Blog]()


**Abstract**

Recent research has highlighted the role of relational inductive biases in building learning agents that can generalize and reason in a compositional manner. However, while relational learning algorithms such as graph neural networks (GNNs) show promise, we do not understand how effectively these approaches can adapt to new tasks. In this work, we study the task of _logical generalization_ using GNNs by designing a benchmark suite grounded in first-order logic. 
Our benchmark suite, **`GraphLog`**, requires that learning algorithms perform rule induction in different synthetic logics, represented as knowledge graphs. **`GraphLog`** consists of relation prediction tasks on 57 distinct logical domains.
We use **`GraphLog`** to evaluate GNNs in three different setups: single-task supervised learning, multi-task pretraining, and continual learning. Unlike previous benchmarks, our approach allows us to precisely control the logical relationship between the different tasks. We find that the ability for models to generalize and adapt is strongly determined by the diversity of the logical rules they encounter during training, and our results highlight new challenges for the design of GNN models. 