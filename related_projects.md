---
layout: page
title: Related Projects
permalink: /related/
---

<ul>
<div class="trigger">
        {% for project in site.data.projects %}
          <li><a href="{{ project.website }}">{{project.name}}</a> - {{project.description}} </li>
        {% endfor %}
</div>
</ul>
