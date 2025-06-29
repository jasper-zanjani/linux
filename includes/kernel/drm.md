The [Direct Rendering Manager (DRM)](https://en.wikipedia.org/wiki/Direct_Rendering_Manager) is a [subsystem of the Linux kernel](https://www.kernel.org/doc/html/latest/gpu/introduction.html) responsible for interfacing with video card GPUs.
DRM is the more modern of the Linux userspace APIs for display, the other being [**fbdev**](#fbdev).
{ .annotate }

DRM exposes GPUs through the filesystem as device files under **/dev/dri** named **card0** etc.

Closely related is **Kernel Mode Setting**, (1) a subcomponent of DRM used to initialize graphics hardware at boot and to change display configuration and mode dynamically (modesetting).
When DRM was first introduced, modesetting was in userspace and closely coupled with X11.
KMS was introduced later and moved modesetting back into kernelspace.
The entire stack is often referred to as DRM/KMS.
{: .annotate }


1.  

    ```mermaid
    ---
    title: KMS pipeline
    ---
    graph LR
        Framebuffer --> Plane 
        subgraph Display controller
        Plane --> CRTC --> Encoder 
        end
        Encoder --> Bridge --- Cable --> Monitor
    ```

- **Framebuffer**: memory buffer with pixel data
- **Plane**: pixel mixing (rotation, scaling, format, etc) layers
- **CRTC** (cathode ray-tube controller): generates timings and pixel streaming
- **Encoder** translates pixel stream to a physical encapsulation (i.e. TMDS for HDMI)
- **Bridge** makes possible transcoding to attach further devices of different types (i.e. DisplayPort)

Display devices are exposed under **/sys/class/drm/card\***
