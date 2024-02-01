**Advanced Linux Sound Architecture (ALSA)** replaced the earlier "Open Sound System".

ALSA kernel modules are designed to offer an interface that "corresponds to that of the hardware" to keep the modules simple, and similar cards will offer a similar interface. 
ALSA kernel modules offer two interfaces: **operational** and **configuration**

**Operational interface** are exposed at /dev/, with 3 main types of devices:

- **PCM** devices, for recording or playing digitized sound samples, come in two varieties - **output** and **input** - and are numbered from 0, which is generally for analog multichannel sound.
- **CTL** or controls are for manipulating the internal mixer and routing of the card. Controls come in 3 types;
    - **Playback** controls are associated with an output device or **copy (input-to-output)** routes
    - **Capture** controls are associated with an input device or **copy (output-to-input)** routes
    - **Feature** controls drive features of the card or mixer, usually just a switch to enable or disable the feature, though some also have levels. The **Master Volume** control is the most typical example, which allows control of the internal amplifier feature of the card. A more interesting example is that of a 3D spatializer that can be represented by a switch to enable or disable it as well as two levels.
- **MIDI** to control the MIDI port, if it exists
- Optionally, **sequencer** devices may also exist if the card has a builtin sound synthesizer with an associated **timer** device

**Configuration interfaces** are exposed at **/proc/asound/**.

Cards have input or output **sockets**, and the **mixer** is controlled by the CTL device and routes sound samples among devices and sockets.

Typical channel assignments

- **0**: front left
- **1**: front right
- **2**: rear left
- **3**: rear right

## Commands

#### amixer
:   

    ```sh
    --8<-- "includes/Commands/a/amixer.sh"
    ```