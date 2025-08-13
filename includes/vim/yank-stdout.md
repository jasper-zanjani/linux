To run a shell command from the normal mode command line, you simply run the **!** command (["bang"](https://learnvimscriptthehardway.stevelosh.com/chapters/52.html)) in normal mode.

```vim
!env

" Run a bash function
!sh -c 'source /home/user/.bashrc.d/functions.sh; function'
```

However to [store the output of that command into a register](https://stackoverflow.com/questions/1694392/vim-store-output-of-external-command-into-a-register), you must run a command like the following, which stores the output of the shell command into the **a** register.

```vim
let @a = system('env')
```
The register signified by **@"** will be placed into the buffer by the **put** command (++p++).

```vim
let @" = system('env')

" Alternatively
put =system('env')
```

