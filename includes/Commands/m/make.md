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
**Makefiles** are sensitive to whitespace, so indentation is significant. The format follows the pattern:
```makefile
{target}: {dependencies}
  {action}
```
where `{target}` is the filename produced by the operation `{action}`, each of which are shell commands.

In [this example](https://subscription.packtpub.com/book/programming/9781838646554/1/ch01lvl1sec06/using-a-makefile-to-compile-and-link-a-program), **hw.o** is produced from **hw.cpp** first because it is a dependency of the executable **hw**. Notably, Makefiles appear to require hard tabs.
```make
CC = g++
all: hw
hw: hw.o
  ${CC} -o hw hw.o
hw.o: hw.cpp
  ${CC} -c hw.cpp
clean:
  rm *.o
```
To remove the .o files:
```sh
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
