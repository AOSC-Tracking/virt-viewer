FROM opensuse/leap:15.1

RUN zypper update -y && \
    zypper install -y \
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
           gdk-pixbuf-devel \
           gettext \
           gettext-devel \
           git \
           glib2-devel \
           glibc-devel \
           glibc-locale \
           gobject-introspection-devel \
           gtk-doc \
           gtk3-devel \
           intltool \
           libgcrypt-devel \
           libgnutls-devel \
           libgovirt-devel \
           libnl3-devel \
           libpulse-devel \
           libtirpc-devel \
           libtool \
           libxml2 \
           libxml2-devel \
           libxslt \
           lsof \
           make \
           net-tools \
           ninja \
           patch \
           perl \
           pkgconfig \
           python3 \
           python3-docutils \
           python3-pip \
           python3-setuptools \
           python3-wheel \
           rpcgen \
           rpm-build \
           screen \
           spice-gtk-devel \
           strace \
           sudo \
           vala \
           vim && \
    zypper clean --all && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.49.0

ENV LANG "en_US.UTF-8"

ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja"
ENV PYTHON "/usr/bin/python3"

ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
