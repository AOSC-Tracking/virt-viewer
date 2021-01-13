# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile opensuse-152 libvirt+dist,libvirt-glib+dist,gtk-vnc+dist,virt-viewer
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/860993e19c005848fde8087941acdbd7ffdcf295
FROM registry.opensuse.org/opensuse/leap:15.2

RUN zypper update -y && \
    zypper install -y \
           autoconf \
           automake \
           bash-completion \
           ca-certificates \
           ccache \
           gcc \
           gettext-devel \
           git \
           glib2-devel \
           glibc-locale \
           gtk-vnc-devel \
           gtk3-devel \
           icoutils \
           libgovirt-devel \
           librest-devel \
           libtool \
           libvirt-devel \
           libvirt-glib-devel \
           libxml2 \
           libxml2-devel \
           make \
           pkgconfig \
           rpm-build \
           spice-gtk-devel \
           vte-devel && \
    zypper clean --all && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
