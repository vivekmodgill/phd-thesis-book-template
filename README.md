# PhD thesis book template (LaTeX)

A LaTeX template for a PhD thesis printed as a book: 170 × 240 mm with 3 mm
bleed, chapter artwork pages, thumb tabs and running heads. Fill in one settings
file, write your chapters, and compile.

## What you get

- Print-ready page geometry: 176 × 246 mm paper (170 × 240 mm trim + 3 mm bleed)
  with `TrimBox` and `BleedBox` set for the printer.
- A title page and a colophon, generated from `thesisinfo.tex`, followed by the
  table of contents.
- For every numbered chapter, automatically:
  - a full-bleed **artwork page** with the chapter number (for example a detail
    from your cover design), facing a page in the artwork's background colour;
  - a right-hand **chapter opener** with a "This chapter is based on" note;
  - the **abstract on its own page**, facing a grey page;
  - a **thumb tab** on right-hand pages that steps down per chapter.
- Running heads (`12 | Chapter 2` on the left, `Short title | 13` on the right).
- Open-source fonts throughout (SIL Open Font License): Libertinus Serif for the
  text (10.5/14 pt), Libertinus Math for equations, and Carlito for headings,
  running heads, tabs and the title page.
- Summary, Nederlandse samenvatting, about the author, research data management, PhD
  portfolio and list of publications, under an "A" thumb tab.
- Author–year citations (natbib) with `apalike-trunc.bst`, which truncates long
  author lists APA-style.

## Quick start

1. Fill in `thesisinfo.tex`: title, name, degree, institution, supervisors, and one short running-head title per chapter.
2. Write your chapters in `chapters/`. Each research chapter shows a different
   case (published paper, preprint with supplement, manuscript in preparation).
3. Replace `references.bib` with your own bibliography.
4. Compile with pdfLaTeX and BibTeX:

   ```sh
   latexmk -pdf book.tex
   ```

The template needs a recent TeX Live or MacTeX with the `libertinus-type1`,
`libertinust1math` and `carlito` font packages (all part of a full TeX Live or
MacTeX installation). `opensans` is optional and is overridden by the book fonts.

## Folder layout

```
book.tex            main file: order of chapters and appendices
thesisinfo.tex      all personal details
preamble.tex        packages and chapter front-matter macros
bookformat.tex      book layout: page size, fonts, openers, tabs, running heads
thesisbook.cls      base class
apalike-trunc.bst   bibliography style
prologue/           title page and colophon, acknowledgements, prologue
chapters/           one folder per chapter, each with its own figures/
appendices/         back matter
figures/            figures shared by the introduction and discussion
openers/            chapter artwork (Chapterpage.pdf)
```

## Writing a chapter

```latex
\basedon[This chapter is based on:]{Author A., Author B. (2025). Title. \textit{Journal}.}
\chapter{Full Chapter Title}
\chapterauthors{Author list and affiliations}   % hidden in the book layout
\begin{chapterabstract}
Abstract text.
\end{chapterabstract}

\section{Introduction}
...
```

- `\basedon` goes **before** `\chapter`. Omit it for chapters not based on a paper.
- `\begin{chapterabstract}[]` (empty heading) gives an opening passage without
  an "Abstract" title, as in the general introduction.
- To add or remove a chapter, edit the `\input` lines in `book.tex` and the
  `\shortchaptertitle` list in `thesisinfo.tex`.
- About 12 thumb tabs fit down the page edge.

## Customising

- **Chapter artwork.** `openers/Chapterpage.pdf` (180 × 250 mm including 5 mm
  bleed) is a light placeholder. Replace it with your own artwork, such as a detail
  from your cover, or delete it to drop the artwork pages altogether. Set
  `artworkback` in `bookformat.tex` to your artwork's background colour.
- **Colours.** The chapter number and tabs use tan (CMYK 0/30/60/21), the
  "based on" rule teal (CMYK 77/37/30/0), and the page behind the artwork a light
  warm grey. Change `chaptertan`, `basedonrule` and `artworkback` in `bookformat.tex`
  to match your cover.
- **Trim size.** Edit `\geometry` and the `TrimBox`/`BleedBox` values at the top
  of `bookformat.tex`.
- **Fonts.** The three `\usepackage` lines near the top of `bookformat.tex` set
  the text, sans-serif and maths fonts. To use another family, replace them and
  check that each chapter abstract still fits on its grey page (the abstract
  size is set in the `chapterabstract` environment).

## Licence

Released under the MIT licence (see `LICENSE`): use, modify and redistribute freely.
`thesisbook.cls` and `apalike-trunc.bst` are derived from third-party files (see Credits),
and their original notices continue to apply to the derived parts. The fonts are not
bundled; they load from your TeX distribution and are licensed under the SIL Open Font
Licence.

## Credits

Built by Vivek Sharma for his PhD thesis and released as a template.
`thesisbook.cls` derives from the RadboudReport LaTeX class; `apalike-trunc.bst`
derives from the standard `apalike` style.
