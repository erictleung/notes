# git Notes

# save your identity
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# removing files
git rm --cached example.txt # stop tracking file

# dealing with remotes
git remote -v # looking at all remotes
git remote rm example-remote # remove remote

# squash commit with last commit and use new message
git commit --amend -m "new message here"

# uncommit last commit but keep all changes
git reset --soft HEAD^

# uncommit and unstage but keep all changes
git reset HEAD^

# uncommit and throw away changes
git reset --hard HEAD^
