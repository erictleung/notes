# SLURM Notes

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
