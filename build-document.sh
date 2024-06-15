#!/bin/bash

# If you wan't to the pdf in the same way as you use an eps
# this is for my memory
# ps2pdf  -dEPSCrop  distro.eps

# where saxon is on my Ubuntu installations as of June 14 2022

source "parameters.sh"

# $SAXON  article.xml  render.xsl  > shit.html
# xmllint  --xinclude shit.html > article.html
# rm shit.html

# ./to-markdown.sh

# Generic article

xsltproc teip5toms.xsl  article.xml | grep -vP '^\s*$' >  article.ms
groff -U -e  -m pdfpic -m pdfmark -ms -k  -s -t -P-pa4 -Tpdf parameters.ms pagination.ms  article.ms >  article.pdf

# Termpaper

xsltproc teip5-to-termpaper.xsl article.xml | grep -vP '^\s*$' >  term-paper.ms
groff -U -e  -m pdfpic -m pdfmark -ms -k  -s -t -P-pa4 -Tpdf parameters.ms pagination.ms term-paper.ms >  term-paper.pdf
groff -U -e  -m pdfpic -m pdfmark -ms -k  -s -t -P-pa4 -Tpdf parameters.ms coverpage.ms >  coverpage.pdf

gs -q -sDEVICE=pdfwrite -dBATCH -dNOPAUSE -sOutputFile="sigfrid_lundberg.pdf" coverpage.pdf term-paper.pdf


echo Number of words: 
perl -ne 's/<[^>]+>/ /g;print;' article.xml  | wc -w


