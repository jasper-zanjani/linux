# TrueNAS

![](logo.svg){: align-center }

TrueNAS supports additional applications through **catalogs**, such as TrueCharts.

Note that TrueNAS uses [**zsh**](../Shell#zsh) as the default shell.

## CLI

TrueNAS offers a [command-line interface](https://www.truenas.com/docs/scale/scaleclireference/) which is available through the [Console Setup Menu](https://www.truenas.com/docs/scale/gettingstarted/install/consolesetupmenuscale/) as well as the shell through the **cli** executable.
By default it is meant to be launched interactively, but a command can be passed as a (quoted) argument to **-c**/**--command**:

```sh
--8<-- "includes/Commands/truenas-cli.sh"
```

It appears to be closely related to SQLite or a similar CLI interface to a SQL database, since it supports similar directives beginning with a period, i.e. **.mode** to display the output mode (which can be either "table" or "csv").


CLI commands are organized in [parent and child namespaces](https://www.truenas.com/docs/scale/scaleclireference/#parent-and-child-namespaces) which generally correspond to UI functions.

## Glossary

#### midclt
:   
    [middleware client](https://www.truenas.com/community/threads/no-way-to-start-stop-services.87322/)

#### TrueCharts 
:   
    [**TrueCharts**](https://github.com/truecharts/apps) is a catalog of applications made available by veteran TrueNAS [forum users](https://www.truenas.com/community/threads/syncthing-on-truenas-scale-21-08-beta.95184/post-658413).

    Applications are collected in several [**trains**](https://truecharts.org/manual/Quick-Start%20Guides/01-Adding-TrueCharts/#adding-truecharts): stable, core, and incubator

    Applications are packaged as Helm packages.