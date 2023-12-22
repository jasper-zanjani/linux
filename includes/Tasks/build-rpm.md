RPM packages depend on [**spec** files](https://rpm-packaging-guide.github.io/#hello-world) (1). 
Running **rpmdev-setuptree** (from the **rpmdevtools** package) builds a tree of directories in $HOME (2) which are used by **rpmbuild** (**rpm-build** package) to build the RPM package and place it in this rpmbuild directory (3).
{ .annotate }

1. 
``` title="Helo, World! spec file"
--8<-- "includes/Configs/hello-world.spec"
```
2. 
``` title="Directory tree under $HOME"
rpmbuild
├── BUILD
├── RPMS
├── SOURCES
├── SPECS
└── SRPMS

6 directories, 0 files
```
3. 
``` hl_lines="3 7 11"
rpmbuild/
├── BUILD
│   └── hello-world.sh
├── BUILDROOT
├── RPMS
│   └── x86_64
│       └── hello-world-1-1.x86_64.rpm
├── SOURCES
├── SPECS
└── SRPMS
    └── hello-world-1-1.src.rpm

8 directories, 3 files
```

```sh
# Build scaffolding in $HOME
rpmdev-buildtree

# Build package from spec file
rpmbuild -ba hello-world.spec
```