# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool manifest ci/manifest.yml
#
# https://gitlab.com/libvirt/libvirt-ci

function install_buildenv() {
    dnf update -y
    dnf install 'dnf-command(config-manager)' -y
    dnf config-manager --set-enabled -y powertools
    dnf install -y centos-release-advanced-virtualization
    dnf install -y epel-release
    dnf install -y \
        bash-completion \
        ca-certificates \
        ccache \
        gcc \
        gettext \
        git \
        glib2-devel \
        glibc-devel \
        glibc-langpack-en \
        gtk-vnc2-devel \
        gtk3-devel \
        icoutils \
        libtool \
        libvirt-devel \
        libvirt-gobject-devel \
        libxml2 \
        libxml2-devel \
        make \
        meson \
        ninja-build \
        pkgconfig \
        rpm-build \
        spice-gtk3-devel \
        vte291-devel
    rpm -qa | sort > /packages.txt
    mkdir -p /usr/libexec/ccache-wrappers
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/gcc
}

export CCACHE_WRAPPERSDIR="/usr/libexec/ccache-wrappers"
export LANG="en_US.UTF-8"
export MAKE="/usr/bin/make"
export NINJA="/usr/bin/ninja"
