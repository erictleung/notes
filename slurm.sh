# SLURM Notes

# Overview
# - Resources
# - SLURM job submit scripts notes
# - Command-line notes
# - Custom functions

# Resources -------------------------------------------------------------------

# - General Exacloud Training Workshop by Ted Laderas
#     https://laderast.github.io/exacloud_tutorial/
# - Multiple serial programs as single SLURM job
#     https://oncomputingwell.princeton.edu/2018/10/how-to-run-multiple-serial-programs-as-a-single-slurm-job/
# - Convenience SLURM commands
#     https://www.rc.fas.harvard.edu/resources/documentation/convenient-slurm-commands/
# - SLURM sbatch script and command-line equivalents
#     https://its.unc.edu/research-computing/techdocs/longleaf-slurm-examples/
# - SLURM srun vs sbatch https://stackoverflow.com/a/43799481/6873133
# - SLURM troubleshooting
#     https://wiki.rc.hms.harvard.edu/display/O2/Troubleshooting+Slurm+Jobs
# - Submitting large jobs
#     https://www.rc.fas.harvard.edu/resources/documentation/submitting-large-numbers-of-jobs-to-odyssey/


# SLURM job submit scripts notes ----------------------------------------------

# useful #SBATCH parameters and brief explanations
#SBATCH --ntasks-per-core
#SBATCH --ntasks-per-node

# default one task/node, but --cpus-per-task will change default
#SBATCH --ntasks=3


# Command-line notes ----------------------------------------------------------

# List accessible partitions
scontrol show partition

# look at paritions, time limits, and job sizes
sinfo -o "%10P %.5a %.10l  %.10s %.16F "

# submit batch jobs
#   options can be inclused in the job file itself
sbatch -options batch_job_file

# cancel job submitted, e.g. job 1234
scancel 1234

# look at all current jobs and your
squeue | less    # scroll through all jobs
squeue -lu $USER # scroll through your jobs

# look at job submit script information
scontrol show jobid -dd <jobid>

# show job priority information
sprio
sprio -l # more useful info like adding usernames to job IDs

# Custom functions ------------------------------------------------------------

# quickly create interactive session
# note: edit partition name (shown below is light) for your use case
function sint () {
  if [ -z "$1" ] || [ -z "$1" ] || [ -z "$1" ]; then
    echo "Usage:"
    echo "  sint [time] [cpus_per_task] [memory]"
    echo ""
    echo "  time (e.g., 2:00:00 for two hours)"
    echo "  cpus_per_task (e.g., 4 for four cores)"
    echo "  memory (e.g., 1024 for 1GB of memory)"
  else
    srun --pty --time=$1 -c $2 --mem $3 -p light bash
  fi
}
