---
layout: page
title: Related Projects
permalink: /related/
---

<ul>
<div class="trigger">
        {% for project in site.data.projects %}
          {% if project.name %}
          <li>  {{project.title}} (<a href="{{ project.website }}">{{ project.website }}</a>) - {{project.description}} </li>
          {% endif %}
        {% endfor %}
</div>
</ul>
