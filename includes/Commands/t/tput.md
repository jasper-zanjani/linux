```sh
--8<-- "includes/Commands/t/tput.sh"
```

The commands **setaf** and **setab** can be used to control terminal codes for color output. (1)
{ .annotate }

1. 
    - **0** black
    - **1** red
    - **2** green
    - **3** yellow
    - **4** blue
    - **5** magenta
    - **6** cyan
    - **7** white
    - **8** n/a
    - **9** default color0

```sh title="Demonstrate color combinations"
#!/bin/bash
for fg_color in {0..7}; do
    set_foreground=$(tput setaf $fg_color)
    for bg_color in {0..7}; do
        set_background=$(tput setab $bg_color)
        echo -n $set_background$set_foreground
        printf ' F:%s B:%s ' $fg_color $bg_color
    done
    echo $(tput sgr0)
done
```