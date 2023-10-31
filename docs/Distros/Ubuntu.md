# Ubuntu

??? info "Impact of Ubuntu"

    From [ LUP 532 ](https://linuxunplugged.com/532?t=1190), Chris explains how he feels the introduction of Flutter applications
    reminds him of the excitement he felt in the heady early days of Ubuntu:

    > Chris: People that haven't been using Linux for very long might forget, but when Ubuntu first came out, they set a direction and tone
    > that caused all these third-party developers to adopt GTK and Python and develop things that would work best in the Unity desktop
    > environment. And they were really a trendsetter in how things should be built. And what I learned by talking to them was that 
    > the developers were looking for an avenue to take that said: if you want to develop an application on Linux, 
    > use this toolkit, package it in this format, you can ship it in the Ubuntu App Store, you can do it this way.

    > Wes: Here's an end-to-end example of all the stuff you might want to do.

    > Chris: Exactly. And as a result of that, we got developers creating applications for desktop Linux that we haven't really seen - 
    > actually it's starting to pick up again but it's been years! And what Canonical could be doing is creating that process again
    > by creating some of their most important tooling, like the installer, App Center, and others that are based on Flutter, that
    > look good, that are functional and performant, that do things that maybe other applications can't, and they set a new standard
    > by leading. Which is what Shuttleworth did when he came to desktop Linux and he said: you don't need three e-mail clients,
    > you don't need six web browsers, you don't need seven different text editors. Pick one of the best and ship it as the default,
    > and we'll do it on top of Debian. And that **was** a big deal and it set a trend.


#### cloud-init

**cloud-init** appears to be the main system used for automating installation of Ubuntu.
It is not to be confused with Subiquity **autoinstall**.

There appear to be two files that need to be provided to the installation media.

- **user-data** (also called the **autoinstall file**) a YAML file with a specific schema 
- **meta-data** usually left empty

These can be provided in one of several ways

1. On a mounted vfat or iso9660 filesystem labeld "**CIDATA**".
2. On the local filesystem, providing kernel commandline parameters
    ```sh
    ds=nocloud;s=file://path/to/directoyr;h=node-42
    ```
3.  On a webserver
    ```sh
    ds=nocloud;s=http://192.168.0.3
    ```

The following line is appended to the kernel command-line to boot using an autoinstall file hosted at the provided address.

```sh
autoinstall ds=nocloud-net;s=http://_gateway:3003/
```

Alternatively, a second mounted drive can contain the autoinstall file, in which case the installer will ask for confirmation.

The autoinstall file is YAML.
The only configuration that is required is the [**identity**](https://ubuntu.com/server/docs/install/autoinstall-reference#identity) key to establish an initial user.

```yaml
version: 1
interactive-sections:
 - network
identity:
 username: ubuntu
 password: $crypted_pass
```
 
[From the autoinstall-quickstart](https://ubuntu.com/server/docs/install/autoinstall-quickstart)

```yaml
autoinstall:
  version: 1
  identity:
    hostname: ubuntu-server
    password: "$6$exDY1mhS4KUYCE/2$zmn9ToZwTKLhCw.b4/b.ZRTIZM30JZ4QrOQ2aOXJ8yk96xpcCof0kxKwuX1kqLG/ygbJ1f8wxED22bTL4F46P0"
    username: ubuntu
``` 

Packages to be installed are passed as a list

```yaml
packages: []
```