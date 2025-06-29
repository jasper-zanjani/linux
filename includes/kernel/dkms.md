[**Dynamic Kernel Module Support**](https://wiki.archlinux.org/title/Dynamic_Kernel_Module_Support) (**DKMS**) is a framework originally developed by Dell Computer Corporation to distribute fixes to customers.
It allows developers to distribute new drivers in a supportable and timely manner.

```sh
# Test status of DKMS and display installed modules
dkms status
```

!!! info "Packages distributed as DKMS modules"

    - [**xone**](https://github.com/medusalix/xone) for Xbox One wireless dongle controller support

Source files must be placed in a directory under **/usr/src** named after the convention **module-version** (i.e. **ixgbe-4.3.15** or **xone-unknown**).
This directory must contain a **dkms.conf** which is a list of shell variables sourced by DKMS when working with the package.

```sh
# Add the module to the kernel tree
sudo dkms add ixgbe/4.3.15 # (1)

# Build the module against the currently running kernel
sudo dkms build ixgbe/4.3.15

# Install the module
sudo dkms install ixgbe/4.3.15
```

1. The module name and version for all sub-commands can be specified in an alternative form using options.
```sh title="Alternative"
sudo dkms add -m ixgbe -v 4.3.15
```

