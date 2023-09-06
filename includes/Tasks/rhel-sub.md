Subscriptions can be managed in a variety of ways: most commonly is from the command-line using the [**subscription-manager**](#subscription-manager) utility.

In Red Hat parlance, Red Hat licenses are specifically called **subscriptions**, and they are **attached** to systems.
Before subscribing a system, it must first be **registered**.
A subscription can then be manually attached to the system by providing the pool ID, an alphanumeric value that can be produced from the command-line by displaying all available subscriptions.

```sh
# Register a system with a subscription service, providing Red Hat username and password interactively
subscription-manager register

# Display available subscriptions
subscription-manager list --available

# Manually attach a subscription providing its pool ID
subscription-manager attach --pool=$POOL_ID
```

All of these steps can be performed at once:

```sh title="Register and subscribe system at once"
subscription-manager register --username $USERNAME --password $PASSWORD --auto-attach
```

Registration can also be done in the [Cockpit web console](#cockpit).
There is a shortcut to the console provided in the GNOME activities menu.

In RHEL9 this can also be done through the [GNOME Settings menu](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/9/html/configuring_basic_system_settings/assembly_registering-the-system-and-managing-subscriptions_configuring-basic-system-settings#registering-a-system-using-red-hat-account-on-gnome_assembly_registering-the-system-and-managing-subscriptions).

Until RHEL5 a [Red Hat Subcription Manager GUI application](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/5/html/deployment_guide/entitlements#launching-rhsm) had also been available.