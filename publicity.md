---
layout: page
title: In the News
permalink: /publicity/
---

<ul>
<div class="trigger">
      {% for pub in site.data.publicity %}
        <li>  <a href="{{ pub.url }}">{{pub.title}}</a> ({{pub.venue}}), {{pub.date}} </li>
      {% endfor %}
</div>
</ul>
