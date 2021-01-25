# THIS FILE WAS AUTO-GENERATED
#
#  $ lcitool dockerfile centos-7 libvirt+dist,libvirt-glib+dist,gtk-vnc+dist,virt-viewer
#
# https://gitlab.com/libvirt/libvirt-ci/-/commit/318adcadcf442daba1883f5046ad1970b65e5ca0
FROM registry.centos.org/centos:7

RUN yum update -y && \
    echo 'skip_missing_names_on_install=0' >> /etc/yum.conf && \
    yum install -y epel-release && \
    yum install -y \
        bash-completion \
        ca-certificates \
        ccache \
        gcc \
        git \
        glib2-devel \
        glibc-common \
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
        ninja-build \
        pkgconfig \
        python3-pip \
        python3-setuptools \
        python3-wheel \
        rest-devel \
        rpm-build \
        spice-gtk3-devel \
        vte291-devel && \
    yum autoremove -y && \
    yum clean all -y && \
    rpm -qa | sort > /packages.txt && \
    mkdir -p /usr/libexec/ccache-wrappers && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/cc && \
    ln -s /usr/bin/ccache /usr/libexec/ccache-wrappers/$(basename /usr/bin/gcc)

RUN pip3 install \
         meson==0.54.0

ENV LANG "en_US.UTF-8"
ENV MAKE "/usr/bin/make"
ENV NINJA "/usr/bin/ninja-build"
ENV CCACHE_WRAPPERSDIR "/usr/libexec/ccache-wrappers"
