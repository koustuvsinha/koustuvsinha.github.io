---
layout: page
title: MongoLive
description: Browser based utility library for offline synchronization with Remote MongoDB instances
img: /assets/img/mongodb.png
---

[Github](https://github.com/koustuvsinha/offline_mongodb)

Being my final year undergraduate project, I was then heavily interested into the NoSQL world, learning the quirks of MongoDB. I came to realize that there were no offline solution to MongoDB instances. While CouchDB, another leading NoSQL provider, had its own offline client solution known as PouchDB, MongoDB had none. So in an attempt to help MongoDB developers to have a client-only offline failsafe, and also to recreate some of the features of PouchDB, I started off with this project with the expert guidance of my mentor Prof Ee Kian Wong.

Features :

* Offline Data saved in LocalStorage
* Easy synchronization to remote MongoDB Instance
* Built in concurrency handler

Caveats :

* Lots of legacy code, needs to be brushed up