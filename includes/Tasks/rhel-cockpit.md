The [**Cockpit web console**](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_systems_using_the_rhel_9_web_console/getting-started-with-the-rhel-9-web-console_system-management-using-the-rhel-9-web-console#what-is-the-RHEL-web-console_getting-started-with-the-rhel-9-web-console) is builtin to Red Hat distributions and, once its socket has been started, is [available at port 9090](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/managing_systems_using_the_rhel_9_web_console/getting-started-with-the-rhel-9-web-console_system-management-using-the-rhel-9-web-console#logging-in-to-the-web-console_getting-started-with-the-rhel-9-web-console).
    
```sh
systemctl enable --now cockpit.socket
```