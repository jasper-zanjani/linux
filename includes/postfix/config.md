Two main configuration files:

-   **/etc/postfix/main.cf**
-   **/etc/postfix/master.cf**

Configuration values:

-   The [`myorigin` parameter](https://www.postfix.org/postconf.5.html#myorigin) specifies the domain that appears in mail that is posted on this machine.


---

-   **/etc/aliases** describes user ID aliases used by sendmail

-   **/etc/postfix/sasl_passwd.db** is a database file created by Postfix to store SMTP authentication credentials 
-   **/etc/postfix/sasl_passwd** (1) stores usernames and passwords
    {: .annotate }

    1.  

        --8<-- "includes/postfix/sasl_passwd.md"
