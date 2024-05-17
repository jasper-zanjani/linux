# NixOS



The [**Nix store**](https://nixos.org/manual/nix/stable/store/) is an abstraction to store immutable file system data such as software packages that can have dependencies on other data.
Stores are specified using URL-like syntax.

```sh
nix path-info --store https://cache.nixos.org/ --json /nix/store/a7gvj343m05j2s32xcnwr35v31ynlypr-coreutils-9.1
```
The **nix**

??? info "Sources"

    

## Commands

##### nix

The **nix** command, intended to unify many disparate Nix package manager utilities, is relatively new and must be [enabled](#configuration).



## Tasks

##### Configuration

| Type      | Location                                                                                          |
| --------- | ------------------------------------------------------------------------------------------------- |
| System    | /etc/nix/[**nix.conf**](https://nixos.org/manual/nix/stable/command-ref/conf-file)                |
| User      | ~/.config/nix/nix.conf                                                                            |
| In-memory | [NIX\_CONFIG](https://nixos.org/manual/nix/stable/command-ref/env-common#env-NIX_CONFIG) (if set) |

```cfg
# Enable nix command
experimental-features = nix-command
```