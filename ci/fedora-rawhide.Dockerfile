FROM fedora:rawhide

RUN dnf update -y --nogpgcheck fedora-gpg-keys && \
    dnf update -y && \
    dnf install -y \
        autoconf \
        automake \
        bash \
        bash-completion \
        ca-certificates \
        ccache \
        chrony \
        cppi \
        cyrus-sasl-devel \
        gcc \
        gdb \
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
        intltool \
        libgcrypt-devel \
        libgovirt-devel \
        libnl3-devel \
        libtirpc-devel \
        libtool \
        libxml2 \
        libxml2-devel \
        libxslt \
        lsof \
        make \
        meson \
        net-tools \
        ninja-build \
        patch \
        perl \
        pkgconfig \
        pulseaudio-libs-devel \
        python3 \
        python3-docutils \
        python3-setuptools \
        python3-wheel \
        rpcgen \
        rpm-build \
        screen \
        spice-gtk3-devel \
        strace \
        sudo \
        vala \
        vim && \
    dnf autoremove -y && \
    dnf clean all -y && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

ENV LANG "en_US.UTF-8"

ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
