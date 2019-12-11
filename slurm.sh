# SLURM Notes

# resources
# - General Exacloud Training Workshop by Ted Laderas
#     https://laderast.github.io/exacloud_tutorial/
# - Multiple serial programs as single SLURM job
#     https://oncomputingwell.princeton.edu/2018/10/how-to-run-multiple-serial-programs-as-a-single-slurm-job/
# - Convenience SLURM commands
#     https://www.rc.fas.harvard.edu/resources/documentation/convenient-slurm-commands/
# - SLURM sbatch script and command-line equivalents
#     https://its.unc.edu/research-computing/techdocs/longleaf-slurm-examples/
# - SLURM srun vs sbatch https://stackoverflow.com/a/43799481/6873133

# useful #SBATCH parameters and brief explanations
#SBATCH --ntasks-per-core
#SBATCH --ntasks-per-node

# default one task/node, but --cpus-per-task will change default
#SBATCH --ntasks=3

# List accessible partitions
scontrol show partition

# look at paritions, time limits, and job sizes
sinfo -o "%10P %.5a %.10l  %.10s %.16F "

# submit batch jobs
#   options can be inclused in the job file itself
sbatch -options batch_job_file

# cancel job submitted, e.g. job 1234
scancel 1234

# look at current jobs
squeue
squeue -lu $USER

# look at job submit script information
scontrol show jobid -dd <jobid>
