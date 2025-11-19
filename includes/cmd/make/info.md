!!! example 

    ```makefile title="Makefile used with mkdocs"
    --8<-- "includes/cmd/make/mkdocs.make"
    ```

A **makefile** (1) provides Make with the information it needs to build artifacts from source code.
{: .annotate }

1.  

    --8<-- "includes/cmd/make/callout.md"

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

-   `tinyconfig` smallest possible kernel configuration
-   `allnoconfig` answer no to every question when creating a config file

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
