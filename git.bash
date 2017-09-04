# git Notes

# save your identity
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com

# removing files
git rm --cached example.txt # stop tracking file

# dealing with remotes
git remote -v # looking at all remotes
git remote rm example-remote # remove remote
git remote add upstream https://github.com/ORIGINAL_OWNER/ORIGINAL_REPOSITORY.git

# squash commit with last commit and use new message
git commit --amend -m "new message here"
git commit --amend # keep previous commit message

# uncommit last commit but keep all changes
git reset --soft HEAD^

# uncommit and unstage but keep all changes
git reset HEAD^ # or...
git reset HEAD~1

# uncommit and throw away changes
git reset --hard HEAD^

# undo git add of a file
git reset file-mistake.txt

# unstage all uncommitted changes
git reset

# revert git repo to previous commit for exploration
git checkout SHA_HASH_CODE

# make commits in previous commit
git checkout -b SHA_HASH_CODE

# remove local/untracked file
git clean -f -n # tell you what will be removed (-n)
git clean -f # remove all files untracked
git clean -fd # want to remove directories as well
git clean -fX # want to remove only ignored files
git clean -fx # want to remove both ignored and non-ignored files

# easily "stash" away commits to use later
git stash # stash away commits and changes
git stash apply # un-stash commits and changes
git stash save name-here # name stash to remember contents of stash
git stash pop stash@{0} # apply particular stash where 0 is number

# squashing multiple commits into one
git rebase -i HEAD~n # where n is the last n commits made

# rebase local branch onto master
git checkout -b local-branch
git rebase master

# syncing a fork
git fetch upstream # given an upstream has been set up
git checkout master
git merge upstream/master

# use git to help find trailing whitespace
git diff --check

# deal with configuration settings
git config --list # look at your config
git config --global user.name "Joe Bob" # change global username to 'Job Bob'
git config --global user.email joe@email.com # change global email

# check differences between staged changed and before you made changes
git diff --cached

# look at changes you are about to make during a commit message
git commit -v

# show staged and unstanged changes (what would be committed with 'git commit')
git diff HEAD

# change branch name
git branch -m new_branch_name # given you're on the branch you want to rename
git branch -m new_branch_name old_branch_name
git push origin :old_branch_name # deletes old branch name from remote origin
git push origin origin new_branch_name # pushes new branch name

# manage reference log information, being when tips of branches are updated
git reflog

# recover deleted local branch that exists in Github
git checkout origin/BranchName # recovers read only pointer
git checkout -b BranchName # creates new branch from old

# rebase local branch to other things
git checkout LocalBranch
git fetch origin # grabs current remote
git rebase origin/master # rebases local branch onto current remote
git rebase master # rebase local branch onto local master

# move commits to new branch
git checkout oldBranch
git branch newBranch
git reset --hard HEAD~n # go back n commits
git checkout newBranch # your n commits will be on the new branch

# pull from origin branch
git pull origin branch-name

# uncommit a file
# source: http://stackoverflow.com/a/15321456
git reset --soft HEAD^ # or
git reset --soft HEAD~1
git reset HEAD path/to/unwanted_file
git commit -c ORIG_HEAD # reuse original commit message

# show changes made from commit
git show COMMIT # where `COMMIT` is the commit ID

# follow git history of file
git log --follow FILENAME

# show last commit changes
git show # verbose output
git show --stat # show message and some stats
git show --summary # get git commit message

# pull branch from remote
# source: http://www.wetware.co.nz/2009/07/pull-a-git-branch-from-remote/
git checkout -b new-branch origin/new-branch # sub origin for remote name

# make existing branch track remote branch
# source: http://stackoverflow.com/a/2286030/6873133
git branch -u upstream/foo # where upstream is remote and foo is branch

# look at leader board of contributors
#   -s : suppress committ description
#   -n : sort output by number of commits
git shortlog -sn

# revert existing commits
git revert HEAD         # revert previous commit
git revert HEAD~3..HEAD # revert the last three commits
git revert 0766c053     # revert specific commit

# some cool tips on git
# source: https://csswizardry.com/2017/05/little-things-i-like-to-do-with-git/

# ignore file mode changes e.g. rw-r--r--
# source: https://stackoverflow.com/a/1257613/6873133
git config core.filemode false

# look at changes from last commit
git log -p -1
git log -p -1 interesting.md # see commit for particular file
