Makefiles specify **rules** which specify a series of cmmands in order to build a **target** file.
The format follows the following pattern, where **TARGET** is the filename produced by the operation **ACTION**, a block of shell commands.

```makefile
TARGET: DEPENDENCIES
	ACTION
```

Specifying the target will run that target's action block.
Running make with no arguments will execute the first target, called the **default goal**.

```sh
# Run specified target
make TARGET

# Run the default goal
make
```

There are some special [**builtin target names**](https://www.gnu.org/software/make/manual/make.html#Special-Targets) that do not refer to files.
Chief among these is **.PHONY** which specifies [**phony targets**](https://www.gnu.org/software/make/manual/make.html#Phony-Targets), or targets which do not actually specify filenames but rather commands.
Phony targets do not list dependencies after the colon and so will never run if not specified as phony targets.

The most common phony target is clean.

```makefile
--8<-- "includes/cmd/make/clean.make"
```
