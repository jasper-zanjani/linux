[VIA](https://github.com/the-via/keyboards) is an open-source web-based interface for configuring keyboards with QMK firmware.
[QMK](https://qmk.fm/) ([Quantum Mechanical Keyboard](https://docs.qmk.fm/)) is an open-source firmware for computer input devices, including keyboards..

Firefox still does not support the [WebHID API](https://caniuse.com/?search=webhid) that allows a browser to access human interface devices.
As of the time of this writing, only Chromium-based browsers support this API.

On Linux, the system will not give the browser access to the keyboard by default.
This can be verified in Chrome by going to **chrome://device-log/**.
The HID device can be given universal read-write [manually](https://bbs.archlinux.org/viewtopic.php?id=285709).

```sh
sudo chmod u+rw /dev/hidraw2
```
