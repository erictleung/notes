# Anaconda notes

# create conda environment
conda create --name snowman
conda create --name snowman python=2.7
conda create --name snowman [packagename]

# activate/deactivate environment
# note: no need for `source` in Windows
source activate snowman
source deactivate

# remove environment
conda remove -n yourenvname --all

# list conda environments
conda info --envs
conda env list

# create conda environments easier using environment.yml
# source: http://stackoverflow.com/a/32799944/6873133

# use Python 2.x and 3.x IPython notebooks with Conda
# source: http://stackoverflow.com/a/30492913/6873133

# create and load replicable Python dev environments
source activate someEnv
conda env export > environment.yml
source deactivate
conda env create -f environment.yml

# package management
conda install packageName  # install packageName
conda list  # list all package installed
conda search anotherPkge  # search for package to install
conda update oldPkge  # update old packages
conda remove unusedPkge  # uninstall/remove unnecessary packages

# extract environment name from within
# source: https://stackoverflow.com/a/42660674/
echo $CONDA_DEFAULT_ENV  # Environment name
echo $CONDA_PREVIX       # Environment path

# Remove unextracted tarballs
conda clean -t

# Remove extract packages that are not currently linked into an environment
conda clean -p
