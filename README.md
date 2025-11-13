# Docker Gowin IDE
Based on https://github.com/abhra0897/gowin-easy-linux/

# Building
1. Make sure the submodule is downloaded: `git submodule update --init`
2. Make sure the git LFS files are downloaded in the submodule: `git lfs install; git lfs pull`
3. Build the container: `docker build . -t gowin_ide`

# Running
`./run.sh`

The container will stay running until receiving a Ctrl-C or a Return key in the launch terminal.

The current working directory is mounted at `/home/gowin/proj` within the container.
