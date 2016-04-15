---
title: Markdown Notes
author: Eric
date: 2016
fontsize: 12pt
bibliography: ref.bib
csl: vancouver.csl
---

**Note**: A lot of these notes pertain to using [Pandoc][pandoc] to convert
`.md` to PDF, how to use the settings in the YAML metadata block above, and
explain command line options.

[pandoc]: http://pandoc.org/

# YAML Metadata Block

## LaTeX Settings

* `fontsize` (e.g. `fontsize: 12pt`)

  Change font size for body text

* `bibliography` (e.g. `bibliography: ref.bib`)

  Add bibliography file for your document

* `csl` (e.g. `csl: vancouver.csl`)

  Uses the Citation Style Language (CSL) to format citation list; [list] of
  journal styles

* `geometry` (e.g. `geometry: margin=1in`)

  Options for the `geometry` package in LaTeX, to say set the margins

[styleList]: https://www.zotero.org/styles
