machinectl is a utility used to access locally hosted virtual machines, however it can also be used to make modifications to the host system itself, for example when [modifying GDM](https://www.reddit.com/r/Fedora/comments/vqwype/machinectl_a_simpler_way_to_modify_gdm/).

```sh
machinectl shell gdm@ /bin/bash
```
