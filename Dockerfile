FROM archlinux:latest

# Install prereqs
RUN pacman -Sy --noconfirm git qt5-base base-devel nss libxcomposite libxdamage libxrandr libxtst alsa-lib pcre2 gtk3 libfaketime ld-lsb freetype2 fontconfig
RUN useradd -ms /bin/bash gowin; mkdir -p /opt/build /proj; chown gowin:gowin /opt/build /proj
USER gowin
WORKDIR /opt/build

# Download AUR package, checkout version 1.9.11
RUN git clone https://aur.archlinux.org/gowin-eda.git; \
    cd gowin-eda; \
    git checkout 5a6d57ba0f289839a39dedca72a8966ec48253ad; \
    makepkg


USER root
RUN pacman -U --noconfirm $(find . -name *.pkg.tar.zst)

# Copy in Sipeed license config file
COPY gwlicense.ini /opt/gowin-eda-ide/bin/gwlicense.ini

USER gowin
WORKDIR /home/gowin/proj

# Environment setup
ENV QT_GRAPHICSSYSTEM=native \
    QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins \
    QT_QPA_PLATFORM=xcb \
    QT_XCB_GL_INTEGRATION=none

#ENTRYPOINT ./main_launcher; read
