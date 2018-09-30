---
layout: page
title: projects
permalink: /projects/
description: Few little creations of mine
---

<ul>

{% for project in site.projects %}

<div>
<li><h4><a href="{{ project.url | prepend: site.baseurl | prepend: site.url }}">{{ project.title }}</a><h5>{{ project.description }}

{% endfor %}

</ul>
