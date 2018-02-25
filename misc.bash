# Miscellaneous CLI Software Tools

# extract pages from PDF using pdftk
# source: https://stackoverflow.com/a/3948329/6873133
pdftk original.pdf cat 1 output page_one.pdf # extract first page
pdftk original.pdf cat 2-end output all_but_one.pdf # remove first page of PDF
