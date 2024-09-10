[**Flexible I/O tester**](https://fio.readthedocs.io/en/latest/fio_doc.html) is provided to benchmark storage workloads.

The first step in using fio is writing an ini format **job file** describing the test's setup.
Each section of the file describes a process; A **global** section sets defaults.

This simple example defines two process that randomly read from a 128MiB file.

```sh
fio --name=global --rw=randread --size=128m --name=job1 --name=job2
```

```ini
[global]
rw=randread
size=128m

[job1]

[job2]
```

In this example, ony a single job is defined and the global section is omitted.
The job will use async I/O and [I/O depth](https://fio.readthedocs.io/en/latest/fio_doc.html#i-o-depth) of 4.

```ini
[random-writers]
ioengine=libaio
iodepth=4
rw=randwrite
bs=32k
direct=0
size=64m
numjobs=4
```

```sh
fio --randrepeat=1 --ioengine=libaio --direct=1 --name=test --filename=test --bs=4k --size=4G --readwrite=randwrite --ramp_time=4
```