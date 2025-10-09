Priorities range from 0-19 in csh (10 is default): lower values mean a higher priority.

```sh
# View priorities of jobs
ps -l

# Run command at a higher priority
nice -5 $CMD &

# Run command at a nice value of (positive) 10
nice -10 $CMD
nice -n 10
nice $CMD
```
