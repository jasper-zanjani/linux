The [Arch build system](https://wiki.archlinux.org/title/Arch_build_system) is a collection of tools for compiling source into installable .pkg.tar.zst packages and comprises a collection of git repositories representing every package available on Arch.
It was inspired by the **ports** system for BSD, which automates the process of building software from source code.

Each repo includes a file called [***PKGBUILD***](https://wiki.archlinux.org/title/PKGBUILD) but none of the software source files (1).
An example PKGBUILD file which can be used as a template is found at /usr/local/pacman.
{ .annotate }

1. 
```sh title="Simple PKGBUILD example"
pkgname="rpm-package-name"
pkgver="0.0.1"
pkgrel="1"
pkgdesc="Mini description of the RPM package."
arch=("x86_64")

source=("filename.rpm")

sha256sums=("SKIP")

package() {
  find $srcdir/ -mindepth 1 -maxdepth 1 -type d | xargs cp -r -t "$pkgdir"
}
```

Packages are built by running [**makepkg**](https://wiki.archlinux.org/title/Makepkg) against a PKGBUILD file, causing the software source files to be downloaded, compiled, and then packaged in a form which can be used with **pacman** to install.

```sh
# Install a local Arch package
pacman -U $PACKAGE
```