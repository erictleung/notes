# sed Notes

# extract first line of file, replace 1 with nth line you want to extract
sed '1q;d' file.txt

# remove first 3 lines from file, replace 3 with n-lines to be removed
sed 1,3d file.txt

# concatenate files together using parts of another, minus sign is key
sed 1,3d file1.txt | cat - file2.txt
