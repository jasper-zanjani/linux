The [**Linux framebuffer (fbdev)**](https://en.wikipedia.org/wiki/Linux_framebuffer) is a [legacy Linux subsystem](https://www.kernel.org/doc/Documentation/fb/framebuffer.txt) to show graphics on a computer monitor.
It was designed as a hardware-independent API to give userspace software access to the framebuffer, the part of a computer's video memory containing the current video frame.
It has largely been superceded by DRM.

- [**fbcon**](https://www.kernel.org/doc/html/latest/fb/fbcon.html) or the "framebuffer console" is a text console running on top of the framebuffer device.
It is can be managed through its sysfs file at **/sys/class/graphics/fbcon**.

