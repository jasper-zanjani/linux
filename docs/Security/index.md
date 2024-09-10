# Overview


## Cryptography

<div class="grid cards" markdown>


-   #### Hashing

    ---

    Cryptographic hashes take arbitrary binary data as input and deterministically produce a fixed-size binary string as output, called the hash value or the message digest.
    The collision rate is the main metric of hash security, and generally the security of a hash function with a digest size of *n* bits should be about as good as a symmetric cipher with half as many bits.

    Hash functions are sometimes provided alongisde packages as checksums, but in fact this practice provides little to no security because if a package is modified malicious then certainly its hash can be as well.
    Preferable is the use of digital signatures which can only be produced from a key.

    Hashes are useful to store passwords.
    They are also used in message authentication codes (MAC) which are used to ensure message integrity of encrypted data.

    A variety of hashing algorithms are available for use to encrypt Linux user passwords (`man 5 crypt` for more information).

</div>

## Prominent vulnerabilities

<div class="grid cards" markdown>

-   #### [CVE-2024-3094](https://access.redhat.com/security/cve/CVE-2024-3094)

    <figure>
    <iframe src="https://player.fireside.fm/v2/RUkczH-V+RJk2qe3U?theme=dark" width="740" height="200" frameborder="0" scrolling="no"></iframe>
    </figure>

    At the end of March, a backdoor was discovered in the xz compression library.
    An attacked using the name Jia Tan installed a carefully hidden backdoor into liblzma, a part of xz that also is a dependency of OpenSSH on systemd-based distributions.

    After several years of contributions to the xz project, apparently made in good faith, Jia Tan ultimately became maintainer of the project.

    A [timeline](https://research.swtch.com/xz-timeline) has been compiled on the clues left by Jia Tan in the xz project's git commit history as well as various communications.

-   #### Library injection vulnerability

    ---

    Similar to DLL files on Windows systems, **.so** ("shared object") library files on Linux allow code to be shared by various processes. 
    They are vulnerable to **injection attacks**. 

    One file in particular, **linux-vdso.so.1**, finds and locates other shared libraries and is mapped by the kernel into the address space of every process. 
    This library-loading mechanism can be exploited through the use of the environment variable **`LD_PRELOAD`**, which is considered the most convenient way to load a shared library in a process at startup. 
    If defined, this variable is read by the system and the library is loaded [immediately](https://www.networkworld.com/article/3404621/tracking-down-library-injections-on-linux.html) after linux-vdso.so.1 into every process that is run. 

    This attack can be detected using the [**osquery**](https://osquery.io/) tool. 
    This tool represents the system as a relational database which can then be queried, in particular against the **process\_envs** table.


</div>

## Commands

#### pwscore
:   
    --8<-- "includes/Commands/p/pwscore.md"

## Tasks

<div class="grid cards" markdown>

-   #### Generate random password

    ---

    ```sh
    # Generate random password
    openssl rand -base64 32

    # Dictionary words
    shuf -n 5 /usr/share/dict/words | tr '\n' '-'
    ```


-   #### Agent installations

    ---

    ##### Rapid 7

    The Rapid 7 agent is called **Insight Agent**.

    ```sh
    chmod +x agent_installer-x86_64.sh
    ./agent_installer-x86_64.sh install_start --token $TOKEN

    # Confirm
    systemctl status ir_agent.service
    ```

    ---

    ##### Crowdstrike


    The CrowdStrike agent is called the CrowdStrike **Falcon Sensor**.

    === ":material-ubuntu: Ubuntu"

        ```sh
        dpkg -i falcon-sensor...deb
        ```

    === ":material-redhat: RHEL"

        ```sh
        # libnl is a dependency only on RHEL 7
        dnf install -y libnl

        rpm -U falcon-sensor...rpm
        ```

    ```sh
    /opt/CrowdStrike/falconctl -s --cid=$CID

    systemctl enable --now falcon-sensor.service

    # Confirm
    systemctl status falcon-sensor.service
    ```


</div>