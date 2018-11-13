# Macport Commands
# Notes: Most will need sudo to run

# remove inactive/old package versions
port uninstall inactive

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
