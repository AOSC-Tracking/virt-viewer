# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool manifest ci/manifest.yml
#
# https://gitlab.com/libvirt/libvirt-ci

FROM registry.fedoraproject.org/fedora:rawhide

RUN dnf update -y --nogpgcheck fedora-gpg-keys && \
    dnf install -y nosync && \
    printf '#!/bin/sh\n\
if test -d /usr/lib64\n\
then\n\
    export LD_PRELOAD=/usr/lib64/nosync/nosync.so\n\
else\n\
    export LD_PRELOAD=/usr/lib/nosync/nosync.so\n\
fi\n\
exec "$@"\n' > /usr/bin/nosync && \
    chmod +x /usr/bin/nosync && \
    nosync dnf distro-sync -y && \
    nosync dnf install -y \
               bash-completion-devel \
               ca-certificates \
               ccache \
               cppi \
               git \
               glibc-langpack-en \
               gtk-vnc2-devel \
               icoutils \
               libtool \
               libxml2 \
               make \
               meson \
               ninja-build \
               rpm-build && \
    nosync dnf autoremove -y && \
    nosync dnf clean all -y

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"

RUN nosync dnf install -y \
               mingw64-gcc \
               mingw64-gettext \
               mingw64-glib2 \
               mingw64-gstreamer1-plugins-bad-free \
               mingw64-gstreamer1-plugins-good \
               mingw64-gtk3 \
               mingw64-headers \
               mingw64-libgovirt \
               mingw64-libvirt \
               mingw64-libxml2 \
               mingw64-pkg-config \
               mingw64-rest \
               mingw64-spice-gtk3 && \
    nosync dnf clean all -y && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/x86_64-w64-mingw32-gcc

ENV ABI "x86_64-w64-mingw32"
ENV MESON_OPTS "--cross-file=/usr/share/mingw/toolchain-mingw64.meson"
