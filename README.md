# Docker Gowin IDE

This container uses the AUR `gowin-eda-ide` package, downgraded to the working 9.11 version. [Sipeed's Gowin license server](https://wiki.sipeed.com/hardware/en/tang/common-doc/get_started/install-the-ide.html) is used to avoid registering for a license.

# Building

`docker build . -t gowin_ide`

# Running

Start the container with `./run.sh` then type `gw_ide`. The IDE may fail connect to the license server at first, but should work after running the command again.

The `proj` folder in the current working directory is mounted at `/home/gowin/proj` within the container. This can be changed in `run.sh`.
