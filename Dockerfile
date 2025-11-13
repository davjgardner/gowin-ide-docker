FROM archlinux:latest

RUN pacman -Sy --noconfirm git qt5-base base-devel nss libxcomposite libxdamage libxrandr libxtst alsa-lib pcre2 gtk3
RUN useradd -ms /bin/bash gowin; mkdir -p /opt/build; chown gowin:gowin /opt/build
USER gowin
WORKDIR /opt/build
RUN git clone https://aur.archlinux.org/gowin-eda.git; cd gowin-eda; makepkg
USER root
RUN pacman -U --noconfirm $(find . -name *.pkg.tar.zst)

RUN mkdir /proj /opt/lic; chown gowin:gowin /proj /opt/lic;
USER gowin

# Download license files
WORKDIR /opt/lic
RUN curl -O https://raw.githubusercontent.com/abhra0897/gowin-easy-linux/refs/heads/master/licenses_backup/gowin.lic; curl -O https://raw.githubusercontent.com/abhra0897/gowin-easy-linux/refs/heads/master/licenses_backup/gowin_Synplifypro.lic

# Environment setup
ENV QT_QPA_PLATFORM_PLUGIN_PATH=/usr/lib/qt/plugins QT_QPA_PLATFORM=xcb QT_XCB_GL_INTEGRATION=none
WORKDIR /proj
# COMMAND  gw_ide
