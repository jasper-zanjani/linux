## Glossary


*[DSM]: Synology DiskStation: a web-based OS for managing Synology NASes
*[MDA]: Mail Delivery Agent: service that downloads email from an MTA, such as procmail and fetchmail
*[MTA]: Mail Transfer Agent: email server, such as sendmail, postfix, smail, and qmail
*[MUA]: Mail User Agent: program that allows a user to view mail, such as mutt, pine, printmail, elm, mail, Thunderbird, Evolution, and Eudora
*[SMB]: Server Message Block

# Distributions

<div class="grid cards" markdown>

-   #### Berkeley Software Distribution (BSD)

    ---

    BSD began in the 70s and was based on AT&T original code. 
    First source distributions required user to purchase a source license from AT&T, since much of the BSD source was derivative of UNIX.

    Berkeley finally released a "wholly-BSD" product as **Network Release 1** in 1989, which satisfied vendor demand for the TCP/IP networking code for PC.

    Work immediately began to reconstruct the remaining functionality of UNIX, which was completed in Network Release 2, released in 1991, which was based entirely on Berkeley code. Eventually this resulted in the 386BSD distribution, which then spawned five interrelated BSD distros: BSDI (now Wind River), NetBSD, FreeBSD, OpenBSD, and Darwin/Mac OS X

    **Unix System Laboratories (USL)** sued BSDI after BSDI attempted to market its product as a real UNIX, and other BSD distributions were affected by disputed code. 
    Ultimately 3 out of the 18,000 files that made up the Network Release 2 distribution were removed, which became known as BSD-lite, released in 1994. 
    This [legal dispute](https://web.archive.org/web/20060315152051/http://www.applelust.com/alust/terminal/archives/terminal041202.shtml) was partly to blame for Linux's rapid ascent in popularity.

-   #### Others

    ----

    - **Alpine Linux** is a security-oriented, lightweight Linux distribution used in containers and hardware.
    - **Clear Linux** is a rolling release distro from Intel with a custom package management system based on **bundles**, collections of packages that contain everything an application requires, including dependencies. 
    Clear's update process also has the ability to do **delta downloads**, preserving bandwidth. 
    It does not provide access with unusual licenses, like ZFS, Chrome, or FFmpeg.
    - **SUSE**{: #suse }
        - **OpenSUSE Leap** is a rebuild of [SUSE Linux Enterprise Server](#sles), similar to how [CentOS](#centos) was historically a rebuild of RHEL.
        - **SUSE Linux Enterprise Server (SLES)** ("slee") is SUSE's fixed-release distribution of Linux intended for enterprises, and as such is comparable to Red Hat's RHEL.


</div>


**display manager**{: #display-manager }
:   
    Basically display managers are the login screens, while the GUI manipulated during normal use represents the desktop environment (i.e. GNOME, KDE, XFCE, etc).

**initrd**{: #initrd } ("initial RAM disk")
:   
    A temporary file system that's loaded into memory when the system boots


**qmail**{: #qmail }
:   
    [MTA](#mta) designed as a drop-in replacement for Sendmail, notable for being the first to be "security-aware". 
    Its various modular subcomponents run independently and are mutually untrustful. 
    It uses SMTP to exchange messages with other MTAs. 

    It was written by Dan Bernstein, a professor of mathematics famous for litigating against the US government with regard to export controls on encryption algorithms. 
    qmail was deprecated and removed from Arch repos in 2005.

**SMB**{: #smb }
:   
    Client/server protocol developed in the early 1980s by Intel, Microsoft, and IBM that has become the native protocol for file and printer sharing on Windows.
    It is implemented in the **Samba**{: #samba } application suite.

#### WSL
:   
    **Windows Subsystem for Linux (WSL)** is shipped with Windows and tied to the Windows release cycle. Windows ships from a single massive codebase, of which WSL is part. 
    WSL was [written](http://azuredevopspodcast.clear-measure.com/craig-loewen-on-the-windows-subsystem-for-linux-devops-story-episode-57 "Azure DevOps Podcast 57: Craig Loewen on the Windows Subsystem for Linux story") mostly in C and and has 3 million monthly active users.

    WSL implements **user services** to connect to WSL distros and to run Windows-native applications like CMD.exe. 
    WSL implements a **9P Protocol** file server to provide seamless integration of the virtualized Linux filesystem and that of the Windows host.

    WSL 1 worked under a **translation architecture** where system calls were translated to NT kernel calls. This meant that applications that used system calls that were newer or more difficult to implement, like GUI applications or Docker, did not run on v1. 

    WSL2 shifted to a **lighweight virtualization** model using the Linux kernel. Now Docker runs on WSL2 and GUI applications can run by using an X server.

    WSL v1 is available on Azure VMs if **nested virtualization** is enabled. WSL2 support is forthcoming.

    VHDs for WSL distributions are available at `%LOCALAPPDATA%\Packages\<PackageFamilyName>\LocalState` where `<PackageFamilyName>` reflects the name of the Microsoft Store package of the distro, i.e.:
    
    - CanonicalGroupLimited.Ubuntu20.04onWindows_79rhkp1fndgsc
    - TheDebianProject.DebianGNULinux_76v4gfsz19hv4

    ```sh
    # Install distro
    wsl.exe --install -d Ubuntu-20.04

    # Remove distro
    wsl.exe --unregister Ubuntu-20.04
    ```

    By default, WSL appears to copy the Windows native hosts file at **%SystemRoot%\System32\drivers\etc\hosts** to the distro's /etc/hosts file.
