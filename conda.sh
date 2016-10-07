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
conda remove -n yourenvname -all
