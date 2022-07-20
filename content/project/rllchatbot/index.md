---
title: "RLLChatBot"
date: 2017-05-01T00:00:00Z
draft: false
summary: "ConvAI 2017 Submission"
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

url_code: ""
url_pdf: "https://arxiv.org/pdf/1811.02714.pdf"
url_slides: ""
url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
slides: ""
---

_Koustuv Sinha, [Nicolas Angelard-Gontier](http://cs.mcgill.ca/~nangel3), [Peter Henderson](http://www.peterhenderson.co/), [Prasanna Parthasarathy](http://cs.mcgill.ca/~pparth2/), Mike Noseworthy &amp; [Joelle Pineau](http://cs.mcgill.ca/~jpineau/)_

As a part of a broader [ConvAI](http://convai.io/) challenge, we, the
Dialog Group of McGill University under the supervision of
[Dr Joelle Pineau](http://cs.mcgill.ca/~jpineau/), have trained a
chatbot which can converse fluently with human judges with respect to a given article. The articles are chosen from a broad corpus of
[SQUAD dataset](https://rajpurkar.github.io/SQuAD-explorer/), where topically they vary from politics to sports to general news. The challenge is to have a fluent conversation with the bot, centering around the topic of the article. Current system uses an ensemble of Generative, Retrieval, and rule based models, and a decision agent learned over actual human-bot responses to select the best candidate response at a given time. We ranked third in the human evaluation round and ranked fourth in the final round held alongside NIPS 2017. Our proposal was also awarded
[ParlAI research grant](https://research.fb.com/announcing-the-winners-of-the-facebook-parlai-research-awards/) from Facebook.
