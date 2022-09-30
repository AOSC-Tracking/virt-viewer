# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool manifest ci/manifest.yml
#
# https://gitlab.com/libvirt/libvirt-ci

function install_buildenv() {
    zypper update -y
    zypper install -y \
           bash-completion \
           ca-certificates \
           ccache \
           cppi \
           gcc \
           gettext-runtime \
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
           ninja \
           pkgconfig \
           python3-pip \
           python3-setuptools \
           python3-wheel \
           rpm-build \
           spice-gtk-devel \
           vte-devel
    rpm -qa | sort > /packages.txt
    mkdir -p /usr/libexec/ccache-wrappers
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
    /usr/bin/pip3 install meson==0.56.0
}

export CCACHE_WRAPPERSDIR="/usr/libexec/ccache-wrappers"
export LANG="en_US.UTF-8"
export MAKE="/usr/bin/make"
export NINJA="/usr/bin/ninja"
