#!/bin/sh
#
# @Author: Jie
# @Date: 2021-07-02 14:44:17
# @LastEditors: Jie
# @LastEditTime: 2021-07-02 14:58:50
#
# Convert PDF to encapsulated PostScript.
#
# Usage:
# ./pdf2eps.sh <path_to_the_single_page_pdf_file>
#
# Requirements:
# pdfcrop (from texlive or mactex)
# pdftops (from xpdf or poppler)

infile="$1"
echo "Cropping the pdf page in $infile..."
pdfcrop "$infile" "$infile.~tmp"
echo "Cropping finished, temporary file \"$infile.~tmp\" generated.\n"

echo "Converting \"$infile.~tmp\" to \"${infile/%.pdf/}.eps\"..."
pdftops -eps "$infile.~tmp" "${infile/%.pdf/}.eps"
echo "Converting finished.\n"

echo "Removing the temporary file \"$infile.~tmp\"..."
rm "$infile.~tmp"
echo "Removing finished.\n"

echo "FINISHED"
