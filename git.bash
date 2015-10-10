# git Notes

# removing files
git rm --cached <filename> # stop tracking file

# dealing with remotes
git remote -v # looking at all remotes
git remote rm <remote_name> # remove remote

# squash commit with last commit and use new message
git commit --amend -m "new message here"

# uncommit last commit but keep all changes
git reset --soft HEAD^

# uncommit and unstage but keep all changes
git reset HEAD^

# uncommit and throw away changes
git reset --hard HEAD^
