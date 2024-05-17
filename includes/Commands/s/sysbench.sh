# Benchmark CPU by calculating prime numbers
sysbench --test=cpu --cpu-max-prime=20000 run

# File I/O benchmarking
sysbench --test=fileio --file-total-size=10G --file-test-mode=rndrw --init-rng=on --max-time=300 --max-requests=0 run
