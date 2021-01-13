# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile centos-stream libvirt+minimal,libvirt-glib,gtk-vnc,virt-viewer
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/860993e19c005848fde8087941acdbd7ffdcf295
FROM docker.io/library/centos:8

RUN dnf update -y && \
    dnf install -y centos-release-stream && \
    dnf install 'dnf-command(config-manager)' -y && \
    dnf config-manager --set-enabled -y Stream-PowerTools && \
    dnf install -y centos-release-advanced-virtualization && \
    dnf install -y epel-release && \
    dnf install -y \
        autoconf \
        automake \
        bash-completion \
        ca-certificates \
        ccache \
        cyrus-sasl-devel \
        gcc \
        gdk-pixbuf2-devel \
        gettext \
        gettext-devel \
        git \
        glib2-devel \
        glibc-devel \
        glibc-langpack-en \
        gnutls-devel \
        gobject-introspection-devel \
        gtk-doc \
        gtk3-devel \
        icoutils \
        intltool \
        libgcrypt-devel \
        libnl3-devel \
        libtirpc-devel \
        libtool \
        libxml2 \
        libxml2-devel \
        libxslt \
        make \
        ninja-build \
        perl \
        pkgconfig \
        pulseaudio-libs-devel \
        python3 \
        python3-docutils \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        rpcgen \
        rpm-build \
        spice-gtk3-devel \
        vala \
        vte291-devel && \
    dnf autoremove -y && \
    dnf clean all -y && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.54.0

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
