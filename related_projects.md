---
layout: page
title: Related Projects
permalink: /related/
---

<ul>
<div class="trigger">
        {% for project in site.data.projects %}
          <li>  {{project.name}} (<a href="{{ project.website }}">{{ project.website }}</a>) - {{project.description}} </li>
        {% endfor %}
</div>
</ul>
