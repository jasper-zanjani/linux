# GRUB2

!!! info "Manual"

    The GNU GRUB Manual is available [here](https://www.gnu.org/software/grub/manual/grub/grub.html).


GNU GRUB provides a shell environment with limited capabilities.

```
grub>
```



Kernel [**command line parameters**](https://www.kernel.org/doc/html/v4.14/admin-guide/kernel-parameters.html) passed in on boot can be queried during runtime:

```grub
setparams 'Install Fedora 38'

    linuxefi /images/pxeboot/vmlinuz inst.stage2=hd:LABEL=Fedora-S-dvd-x86_64-38 quiet\
        ip=192.168.0.200::192.168.0.1:255.255.255.0::ens3:off\
        inst.ks=http://192.168.0.3/kickstart.cfg
    initrdefi /images/pxeboot/initrd.img
```

```sh
cat /proc/cmdline
```

## grub.cfg

```sh title="Fedora 38 grub.cfg"
--8<-- "includes/Configs/fedora38-grub.cfg"
```

[**search**](https://www.gnu.org/software/grub/manual/grub/html_node/search.html) is used to find the root file system and accepts a variety of options.

```sh
# Search by file system label
search --no-floppy --set=root -l $LABEL
```

## Tasks

#### Loading linux
:   
    ```
    grub> set prefix=(hd0,1)/boot/grub
    grub> set root=(hd0,1)
    grub> insmod normal
    grub> normal
    ```

    The most common task done at the GRUB command-line is simply starting linux.
    The prefix and root environment variables are set before loading and running the normal module.
    
    - [**prefix**](https://www.gnu.org/software/grub/manual/grub/grub.html#prefix) is an [absolute filename](https://www.gnu.org/software/grub/manual/grub/grub.html#File-name-syntax) (UNIX-style path but including the device name in parentheses) indicating where GRUB modules are found
    - [**root**](https://www.gnu.org/software/grub/manual/grub/grub.html#root) specifies a device for files which do not specify one
    - [**insmod**](https://www.gnu.org/software/grub/manual/grub/grub.html#insmod) inserts a dynamic GRUB module
    - [**normal**](https://www.gnu.org/software/grub/manual/grub/grub.html#normal) enters normal mode and displays the GRUB menu



    Running [**ls**](https://www.gnu.org/software/grub/manual/grub/grub.html#ls)  displays devices or files using the GRUB [device syntax](https://www.gnu.org/software/grub/manual/grub/grub.html#Device-syntax).
    
    Here, only the USB drive is available to the system.
    When additional drives are available, their

    ``` hl_lines="2"
    grub> ls
    (proc) (hd0) (hd0,msdos1)
    ```
    
    Invoking the [**set**](https://www.gnu.org/software/grub/manual/grub/grub.html#set) command without arguments will display all environment variables.
    Here the prefix and root variables are set before inserting and loading the normal module:
    
    ```
    grub> set prefix=(hd0,msdos1)/boot/grub
    grub> set root=(hd0,msdos1)
    grub> insmod normal
    grub> normal
    ```

#### Resetting root password
:   
    Append **rd.break** to the list of command-line parameters to GRUB.
    Once the shell is ready, run the following commands
    
    ```sh
    mount -o remount,rw /sysroot
    chroot /sysroot
    passwd root
    ```

#### Text-mode installation
:   
    RHEL can be installed from the console by providing **inst.text** as a kernel parameter on boot by pressing ++Tab++ on the GRUB splash screen.

#### GRUB rescue prompt
:   
    During GRUB's normal startup procedure, the **prefix** and **root** environment variables are first set before loading the **normal module**.
    When the normal module has failed to load because the GRUB folder or its contents are missing or corrupted, it displays a [**rescue shell**](https://www.gnu.org/software/grub/manual/grub/grub.html#GRUB-only-offers-a-rescue-shell)
    ```
    grub rescue>
    ``` 

    ```
    grub rescue> set prefix=(hd0,1)/boot/grub
    grub rescue> set root=(hd0,1)
    grub rescue> insmod normal
    grub rescue> normal
    ```



    After booting the system, GRUB should be updated and reinstalled:

    Update GRUB config file
    ```sh
    update-grub
    ```
    Reinstall GRUB
    ```sh
    grub-install /dev/sdx
    ```


## Commands

??? info "GRUB2"

    Until recently, GRUB2 executables were prefixed with **grub2-**, while **GRUB Legacy** took **grub-**.
    This is no longer the case and all recent GRUB executables begin with **grub-**.

```sh title="grub-install"
--8<-- "includes/Commands/grub-install.sh"
```

**grub-mkconfig** (previously **grub2-mkconfig**) is used to create a GRUB config file from the settings defined in **/etc/default/grub**.

```sh title="grub-mkconfig"
--8<-- "includes/Commands/grub-mkconfig.sh"
```

```sh title="update-grub"
--8<-- "includes/Commands/update-grub.sh"
```

#### mkinitcpio
:   
    **mkinitcpio** is a bash script used to create an **initial ramdisk** environment, which loads various kernel modules and sets up various things before handing over control to init.
    This allows encrypted root filesystems and root filesystems on a software RAID array.

    mkinitcpio uses **presets** (.preset files found in **/etc/mkinitcpio.d/**) to generate two images:

    - **default** ramdisk image which follows the directives specified in the configuration
    - **fallback** ramdisk image, the same as the default, except that the **autodetect** hook is skipped, including a full range of modules which improve support and compatibility

    ```sh
    --8<-- "includes/Commands/mkinitcpio.sh"
    ```