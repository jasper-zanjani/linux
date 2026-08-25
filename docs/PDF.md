# PDF

--8<-- "includes/links.md"

Make excerpts of PDFs with **qpdf**.

```sh
PAGE_RANGE=250-300
qpdf --empty --pages $INPUT_FILE $PAGE_RANGE -- $OUTPUT_FILE
```

OCR with **pdftotext**.

```sh
pdftotext -x 48 -y 48 -layout -nopgbrk $INPUT_FILE $OUTPUT_FILE
```

- `-nopgbrk` avoid line-feed character between pages
- `-layout` preserve spaces and layout of input file
- `$OUTPUT_FILE` if none provided, will output to the PDF's filename with .pdf replaced by .txt

A bizarre workflow is necessary to OCR tables.

If starting with a PDF file, convert to an image with a high resolution using **pdftoppm**.

- `$OUTPUT_PREFIX` will determine the filename, suffixed by page number

```sh
pdftoppm -png -rx 300 -ry 300 $INPUT_FILE $OUTPUT_PREFIX

# Specify a range of pages
pdftoppm -f 10 -l 11 $INPUT_FILE $OUTPUT_PREFIX
```

Then use tesseract to perform OCR on the image, but re-embedding it into a PDF.

```sh
tesseract $INPUT_IMAGE $OUTPUT_PREFIX -l eng --psm 11 pdf
```

Finally, pdftotext can be used, preserving layout:

```sh
# stdout
pdftotext -layout -nopgbrk $INPUT_FILE -
```
