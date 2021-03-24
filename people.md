---
layout: page
title: People
permalink: /people/
---

<p>
   Project Everest is a joint project between
   <a href="http://research.microsoft.com">Microsoft Research</a>,
   <a href="http://prosecco.gforge.inria.fr/">INRIA Paris</a>,
   <a href="http://www.andrew.cmu.edu/user/bparno/">Carnegie Mellon University</a>,
   the <a href="http://www.msr-inria.fr">MSR-INRIA joint center</a>,
   <a href="https://homepages.inf.ed.ac.uk/mkohlwei">The University of Edinburgh</a>,
   <a href="https://www.mpi-sp.org">MPI-SP</a>,
   and the community at large.
   We have had many interns and collaborators from other institutions work on related projects as well.
</p>

<div style="margin:0 auto">
  <h3>Researchers</h3>
  <div style=" ">
    <ul style="padding-left:2em; margin:0px 0px 0px 0px">
      {% for member in site.data.members %}
        <li><a href="{{ member.url}}"> {{member.firstname}} {{member.lastname}}</a> ({{member.lab}})</li>
      {% endfor %}
    </ul>
  </div>
 <h3>Students, PostDocs, and Interns</h3>
  <div style="">
    <ul style="padding-left:2em; margin:0px 0px 0px 0px">
      {% for member in site.data.students %}
        <li><a href="{{ member.url}}"> {{member.firstname}} {{member.lastname}}</a> ({{member.lab}})</li>
      {% endfor %}
    </ul>
  </div>
 <h3>Other Participants</h3>
  <div style="">
    <ul style="padding-left:2em; margin:0px 0px 0px 0px">
      {% for member in site.data.others %}
        <li><a href="{{ member.url}}"> {{member.firstname}} {{member.lastname}}</a> ({{member.lab}})</li>
      {% endfor %}
    </ul>
  </div>
</div>
