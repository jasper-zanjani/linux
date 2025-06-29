Media Transfer Protocol (MTP) is a protocol that allows data transfer between two devices and is primarily associated with Android.

We can check if a device is successfully connected using **gio**

```sh
gio mount -li | grep "activation"
```

We can not look for the directory named after this URL located in **/run/user/$UUID/gvfs**

Alternatively we can mount the device using a URL built from the bus and device number output by **lsusb**

```sh
gio mount "mtp://[usb:001,007]/"
```


MTP devices are mounted to [**/var/run/user/$UID/gvfs**](https://askubuntu.com/questions/342319/where-are-mtp-mounted-devices-located-in-the-filesystem)

