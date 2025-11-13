FROM archlinux:latest

# Install prereqs
RUN pacman -Sy --noconfirm git qt5-base base-devel nss libxcomposite libxdamage libxrandr libxtst alsa-lib pcre2 gtk3 libfaketime ld-lsb freetype2 fontconfig
RUN useradd -ms /bin/bash gowin; mkdir -p /opt /proj; chown gowin:gowin /opt /proj
USER gowin
WORKDIR /opt

# Build and install IDE
COPY --chown=gowin:gowin gowin-easy-linux /opt/gowin-easy-linux/

WORKDIR /opt/gowin-easy-linux

# Environment setup
ENV QT_GRAPHICSSYSTEM=native \
    QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins \
    QT_QPA_PLATFORM=xcb \
    QT_XCB_GL_INTEGRATION=none \
    LD_PRELOAD=/usr/lib/faketime/libfaketime.so.1 \
    FAKETIME="@2020-07-01 00:00:00" \
    FAKETIME_DONT_RESET=1

ENTRYPOINT ./main_launcher; read
