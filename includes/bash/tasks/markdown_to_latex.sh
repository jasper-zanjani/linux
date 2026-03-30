#/usr/bin/env bash
for MARKDOWN_FILE in md/*.md
do 
    # Exit loop if no files found
    [[ $MARKDOWN_FILE = "md/*.md" ]] && continue
    LATEX_OUTPUT=${MARKDOWN_FILE//md/tex}
    pandoc -f markdown -t latex $MARKDOWN_FILE > $LATEX_OUTPUT
done

