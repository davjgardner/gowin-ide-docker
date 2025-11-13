# Docker Gowin IDE
Based on https://github.com/abhra0897/gowin-easy-linux/

This container uses `libfaketime` to keep the included license file valid. No separate license is necessary. Note that this will mess up the modification times on any project files. The container date is set to 2025-07-01.

Some effort has been put into minimizing the necessary installed packages but more could probably still be done - `gtk3` is included as a crutch to pull in any missing graphics or font packages.

A bridge network is needed to set the mac address to match the license file. The X11 unix socket is passed through as a bind mount, since host networking is not available.

# Building
1. Make sure the submodule is downloaded: `git submodule update --init`
2. Make sure the git LFS files are downloaded in the submodule: `git lfs install; git lfs pull`
3. Build the container: `docker build . -t gowin_ide`

# Running
`./run.sh`

The container will stay running until receiving a Ctrl-C or a Return key in the launch terminal.

The current working directory is mounted at `/home/gowin/proj` within the container. This can be changed in `run.sh`.
