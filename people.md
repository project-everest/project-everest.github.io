---
layout: page
title: People
permalink: /people/
---

<p>
   Project Everest is a joint project between <a href="http://research.microsoft.com/en-us/labs/redmond/">MSR Redmond</a>, <a href="http://research.microsoft.com/en-us/labs/cambridge/">MSR Cambridge</a>, <a href="http://research.microsoft.com/en-us/labs/india/">MSR Bangalore</a>, the <a href="http://www.msr-inria.fr">MSR-INRIA joint center</a>, and <a href="http://prosecco.gforge.inria.fr/">INRIA Paris</a>.
   We have had many interns and collaborators from other institutions work on related projects as well.
</p>

<div style="margin:0 auto">
  <h3>Current team</h3>
  <div style="float:left; ">
    <ul style="padding-left:2em; margin:0px 0px 0px 0px">
      {% for member in site.data.members %}
        <li><a href="{{ member.url}}"> {{member.firstname}} {{member.lastname}}</a> ({{member.lab}})</li>
      {% endfor %}
    </ul>
  </div>

</div>