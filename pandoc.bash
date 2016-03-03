# Pandoc Notes

# make source code have nice shaded background
pandoc example.md -o example.pdf --highlight-style=tango

# compile document with table of contents
pandoc example.md -o example.pdf --toc # or...
pandoc example.md -o example.pdf --table-of-contents
