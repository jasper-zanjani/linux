SysVInit is the oldest init system used in Linux.

In SysVinit, which used bash scripts to run and manage servicesj, processes were started serially and synchronously, wasting time and system resources.
For years, a common mitigation was to run services in the background, simulating concurrency.
