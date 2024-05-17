# Overview

A variety of hashing algorithms are available for use to encrypt Linux user passwords (`man 5 crypt` for more information).)

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