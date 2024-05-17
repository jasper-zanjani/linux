```sh
# Display operating system "Linux"
uname

# Kernel architecture
uname -m

# Kernel release version
uname -r
# --kernel-release

uname -a
```

The output of **-r**/**--kernel-release** can be used to navigate to some system directories:
```sh
ls /usr/lib/modules/$(uname -r)/kernel
```