Although a free version of ffmpeg is available in Fedora's repos (as **ffmpeg-free**), it is hamstrung by the lack of proprietary codecs.

The full ffmpeg must be installed from RPM Fusion repos.

```sh
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
```
