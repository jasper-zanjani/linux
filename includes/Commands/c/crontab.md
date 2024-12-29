#### crontab
:   
    **crontab** is the command associated with the **cron** daemon, which is used to schedule recurrent tasks.
    There are in fact many implementations of cron, although the most common appears to be [**cronie**](https://github.com/cronie-crond/cronie) which includes an implementation of anacron.
    It is used by both Arch Linux and RHEL, although the daemon is called cronied in Arch and crond in RHEL.

    ```sh
    # Display pending cron jobs
    crontab -l

    # Edit user-specific crontab file found at /var/spool/cron
    crontab -e
    ```

    **Crontabs** (cron tables) can be placed in any of a number of different locations:

    - **/etc/crontab** The historical location for system cron jobs. Cronie does not create this file automatically although it will be honored.
    - **/etc/cron.d** directory for packages to add cron entries
    - **/var/spool/cron** User-specific crontabs created with `crontab -e`

    === "Examples"
    
        ```sh title="Examples"
        # 3 AM everyday
        0 3 * * * /usr/bin/true       

        # 2nd of every mont
        30 16 2 * * /usr/bin/true     


        # 4:05 AM every Sunday
        5 4 * * sun /usr/bin/true     

        # 10 PM every weekday
        0 22 * * 1-5 /usr/bin/true    

        # 23rd minute of every even hour (0023, 0223, 0423, etc) everyday
        23 0-23/2 * * * /usr/bin/true 
        ```

    === "Directives"

        ```sh
        @hourly             # equivalent to 0 * * * *
        @midnight           # equivalent to 0 0 * * *
        @daily              # "
        @weekly             # equivalent to 0 0 * * 0
        @monthly            # equivalent to 0 0 1 * *
        @annually           # equivalent to 0 0 1 1 *
        @yearly             # "
        @reboot             # at startup
        ```

    === ":material-redhat: RHEL default /etc/crontab"

        ```sh
        cat /etc/crontab
        SHELL=/bin/bash
        PATH=/sbin:/bin:/usr/sbin:/usr/bin
        MAILTO=root

        # For details see man 4 crontabs

        # Example of job definition:
        # .---------------- minute (0 - 59)
        # |  .------------- hour (0 - 23)
        # |  |  .---------- day of month (1 - 31)
        # |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
        # |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
        # |  |  |  |  |
        # *  *  *  *  * user-name  command to be executed
        ```

