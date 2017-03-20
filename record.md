---
layout: page
title: Implementing and Proving the TLS 1.3 Record Layer
permalink: /record/
hide_header_link: true
---

This website contains supplemental material for the paper

_Implementing and Proving the TLS 1.3 Record Layer_.
K. Bhargavan, A. Delignat-Lavaud, C. Fournet, M. Kohlweiss, J. Pan,
J. Protzenko, A. Rastogi, N. Swamy, S. Zanella-Béguelin,
J. K. Zinzindohoué. In 38th IEEE Symposium on Security and
Privacy, IEEE Computer Society 2017.

## Technical Report

The following report includes additional materials and proofs of the
results in Sections III-V of the paper:

[_Implementing and Proving the TLS 1.3 Record Layer_](https://eprint.iacr.org/2016/1178),
K. Bhargavan, A. Delignat-Lavaud, C. Fournet, M. Kohlweiss, J. Pan,
J. Protzenko, A. Rastogi, N. Swamy, S. Zanella-Béguelin,
J. K. Zinzindohoué. Cryptology ePrint Archive, Report 2016/1178.

## Source code

All verified code we report on in the paper can be obtained by cloning the
[Everest project repository in GitHub](https://github.com/project-everest/everest).

For convenience we have created [a branch called _record-layer-tr_](https://github.com/project-everest/everest/tree/record-layer-tr) that contains
a snapshot at the time of this writing.

To obtain the code, run

```
$ git clone https://github.com/project-everest/everest --branch record-layer-tr
$ cd everest
$ ./everest pull
```

The specifications, implementations and proofs of the record-layer constructions
are located in the `hacl-star/spec`, `hacl-star/code` and `hacl-star/secure_api`
folders, respectively

The code can be built and run using

```
$ ./everest make
```

The code encompases several open-source projects, namely:


- The [F*](https://github.com/FStarLang/FStar/), including libraries for
  fixed-size integer arithmetic and buffers.

- The [KreMLin compiler](https://github.com/FStarLang/kremlin/) from F* to C.

- The development version of [miTLS](https://github.com/mitls/mitls-fstar/),
  extended to TLS 1.3, implemented in F*. While verification of the full
  codebase is in progress, the repository contains verified protocol-specific
  code for the record layer fragment reported in the paper.

- The [HACL* cryptographic library](https://github.com/mitls/hacl-star/">),
  notably including our verified code for cryptographic algorithms and the AEAD
  construction.
  
