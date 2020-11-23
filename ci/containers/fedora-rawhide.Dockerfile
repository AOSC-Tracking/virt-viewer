FROM registry.fedoraproject.org/fedora:rawhide

RUN dnf update -y --nogpgcheck fedora-gpg-keys && \
    dnf update -y && \
    dnf install -y \
        autoconf \
        automake \
        bash-completion \
        ca-certificates \
        ccache \
        gcc \
        gettext-devel \
        git \
        glib2-devel \
        glibc-langpack-en \
        gtk-vnc2-devel \
        gtk3-devel \
        icoutils \
        libgovirt-devel \
        libtool \
        libvirt-devel \
        libvirt-gobject-devel \
        libxml2 \
        libxml2-devel \
        make \
        pkgconfig \
        rest-devel \
        rpm-build \
        spice-gtk3-devel && \
    dnf autoremove -y && \
    dnf clean all -y && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
