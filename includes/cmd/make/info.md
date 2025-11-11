!!! example 

    ```makefile title="Makefile used with mkdocs"
    --8<-- "includes/cmd/make/mkdocs.make"
    ```

A **makefile** provides Make with the information it needs to build artifacts from source code.
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

If the target file already exists, make inspects its metadata and compares its last modification date with that of the source files, and will not execute anything if the source files have not been updated since the last execution.
This ensures that the time-intensive build process is not executed unnecessarily by mistake.

!!! info "Hard tabs only!"

	**Makefiles** are sensitive to whitespace, so indentation is significant. 
	But leading spaces cause errors, only hard tabs are accepted.

There are some special [**builtin target names**](https://www.gnu.org/software/make/manual/make.html#Special-Targets) that do not refer to files.
Chief among these is **.PHONY** which specifies [**phony targets**](https://www.gnu.org/software/make/manual/make.html#Phony-Targets), or targets which do not actually specify filenames but rather commands.
Phony targets do not list dependencies after the colon and so will never run if not specified as phony targets.

The most common phony target is clean.

```makefile
--8<-- "includes/cmd/make/clean.make"
```

##### Configure, Make, Make Install

A common formula when installing software from source is the [following](https://thoughtbot.com/blog/the-magic-behind-configure-make-make-install "thoughtbot.com: \"The magic behind configure, make, make install\"") sequence of commands 

```sh
./configure
make
make install
```

Given there are 3 example files (main.cpp, message.cpp, and message.h) in a directory, it produces an executable file named `a.out`

```sh
g++ main.cpp message.cpp
```

Install an alternate version of a program like Python

```sh
cd /opt
wget https://www.python.org/ftp/python/3.8.0/Python-3.8.0.tgz
tar xzf Python-3.8.0.tgz
cd Python-3.8.0
./configure --enable-optimizations
make altinstall
```

In [this example](https://subscription.packtpub.com/book/programming/9781838646554/1/ch01lvl1sec06/using-a-makefile-to-compile-and-link-a-program), **hw.o** is produced from **hw.cpp** first because it is a dependency of the executable **hw**.

```makefile
--8<-- "includes/cmd/make/cpp.make"
```


```sh
# Remove
make clean
```

Targets

- `tinyconfig` smallest possible kernel configuration
- `allnoconfig` answer no to every question when creating a config file

A **configure script** is responsible for preparing the software build, ensuring dependencies are available, such as a C compiler for C programs. 
`make` is invoked after the `configure` script has done its job. 
The **configure** script converts a `Makefile.in` template into a **Makefile**. 
They are not built by hand but packaged by yet another program in the **autotools** suite, such as **autoconf**, **automake**, and others.

A configure.ac file written in **m4sh** (a combination of m4 macros and shell script) is prepared. The first m4 macro called i **AC_INIT**, which initializes autoconf:

```m4
AC_INIT([helloworld], [0.1], [george@thoughtbot.com])
```

The **AM_INIT_AUTOMAKE** macro is also called because we're using **automake**:

```m4
AM_INIT_AUTOMAKE
```
