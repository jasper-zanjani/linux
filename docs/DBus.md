# DBus

DBus is a message bus system that allows different processes to communicate with each other in a distributed environment.
DBus is an **interprocess communication** (IPC) system that enables communication between two or more processes.
DBus is a key dependency for all Linux desktop environments, which use DBus to integrate applications, shell extensions, and services.

DBus consiste of there primary components:

- The bus is the primary communication point for all DBus-enabled applications and manages the routing of messages between applications.
- Services which self-register with the bus, making themselves discoverable to other applications
- The interface, a collection of methods, signals, and properties that a service exposes.

```sh
dbus-send --system --type=method_call --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager org.freedesktop.NetworkManager.AddAndActivateConnection '{"connection": {"type": "802-11-wireless", "uuid": "MyWiFiConnection", "id": "My Wifi", "ssid": "MyWifiSSID"}}'
```
