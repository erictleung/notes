# Macport Commands
# Notes: Most will need sudo to run

# update Macports itself
port selfupdate

# update outdated programs
port upgrade outdated

# show ports which need updating
port outdated

# show inactive ports
port installed inactive

# remove inactive ports
port uninstall inactive

# search exact package name
# source: http://johnlaudun.org/20140721-install-r-with-macports/
port search --exact R

# clean up caches and inactive package versions
# source: https://apple.stackexchange.com/a/267184
port uninstall inactive
port clean --all uninstalled
port clean installed
