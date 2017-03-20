---
layout: page
title: Implementing and Proving the TLS 1.3 Record Layer
permalink: /record/
hide_header_link: true
---

This website contains supplemental material for the paper

<p>
<i>Implementing and Proving the TLS 1.3 Record Layer</i>.
K. Bhargavan, A. Delignat-Lavaud, C. Fournet, M. Kohlweiss, J. Pan,
J. Protzenko, A. Rastogi, N. Swamy, S. Zanella-Béguelin,
J. K. Zinzindohoué. In 38th IEEE Symposium on Security and
Privacy, IEEE Computer Society 2017.
</p>

<h2> Technical Report </h2>

The following report includes additional materials and proofs of the
results in Sections III-V of the paper:

<a href="https://eprint.iacr.org/2016/1178"><i>Implementing and
Proving the TLS 1.3 Record Layer</i></a>, K. Bhargavan,
A. Delignat-Lavaud, C. Fournet, M. Kohlweiss, J. Pan, J. Protzenko,
A. Rastogi, N. Swamy, S. Zanella-Béguelin, J. K. Zinzindohoué.
Cryptology ePrint Archive, Report 2016/1178.

<h2> Source code </h2>

<p>
All verified code we report on in the paper can be obtained by cloning
the <a href="https://github.com/project-everest/everest"
target="_blank">Everest project repository in GitHub</a>. For
convenience we have created <a
href="https://github.com/project-everest/everest/tree/record-layer-tr">a
branch called <i>record-layer-tr</i></a> that contains a snapshot at
the time of this writing.
</p>

<p>
To obtain the code, run

<pre>
$ git clone https://github.com/project-everest/everest --branch record-layer-tr
$ cd everest
$ ./everest pull
</pre>

The specifications, implementations and proofs of the record-layer
constructions are located in the <tt>hacl-star/spec</tt>,
<tt>hacl-star/code</tt> and <tt>hacl-star/secure_api</tt> folders,
respectively

The code can be built and run using
<pre>
$ ./everest make
</pre>
</p>

<p>
The code encompases several open-source projects, namely:

<ul>
<li>
  The <a href="https://github.com/FStarLang/FStar/">F*
  programming language</a>, including libraries for fixed-size integer
  arithmetic and buffers.
</li>

<li>
  The <a href="https://github.com/FStarLang/kremlin/">KreMLin
  compiler</a> from F* to C.
</li>

<li>
  The development version of <a
  href="https://github.com/mitls/mitls-fstar/">miTLS</a>, extended to
  TLS 1.3, implemented in F*. While verification of
  the full codebase is in progress, the repository contains verified
  protocol-specific code for the record layer fragment reported in
  the paper.
</li>

<li>
  The <a href="https://github.com/mitls/hacl-star/">HACL*
  cryptographic library</a>, notably including our verified code for
  cryptographic algorithms and the AEAD construction.
</li>
</ul>
</p>