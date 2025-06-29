A **slice unit** is a unit configuration file ending in ".slice" which manages resources of a group of processes.
SystemD slices implement and build on Linux cgroups.

Slices exist in a hierarchy below the **root slice** (**-.slice**) and are used to group **scopes** and **services**

- **Scopes** contain unrelated processes but not necessarily hierarchically
- **Services** are from unit files or Transient Runtime Services and contain processes

Root slices themselves only contain scopes and other slices.

- **user.slice** contains all user-related slices and scopes, named after the pattern **user-UID.slice**

    - **session.slice** is created for every login session

- **system.slice** contain slices, scopes, and services

- **machine.slice** contains all container-related slices, scopes, and services.

Services can be assigned to specific slices explicitly by editing the value of the **Slice** key in the service file.
Keys like **CPUWeight** can assign cgroup resource controls.
Other such controls can be viewed in the **systemd.resource-control(5)** man page.
```ini
[Unit]
Slice=user.slice
CPUWeight=50
```

