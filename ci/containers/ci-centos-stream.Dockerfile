# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile centos-stream-8 libvirt+minimal,libvirt-glib,gtk-vnc,virt-viewer
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/6cd723b4affb2ee67e7d462dac480191c4b97598

FROM quay.io/centos/centos:stream8

RUN dnf update -y && \
    dnf install 'dnf-command(config-manager)' -y && \
    dnf config-manager --set-enabled -y powertools && \
    dnf install -y centos-release-advanced-virtualization && \
    dnf install -y epel-release && \
    dnf install -y \
        bash-completion \
        ca-certificates \
        ccache \
        cpp \
        cyrus-sasl-devel \
        gcc \
        gdk-pixbuf2-devel \
        gettext \
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
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc

RUN pip3 install \
         meson==0.56.0

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
