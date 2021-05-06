FROM centos:latest

LABEL maintainer="Joerg Klein <kwp.klein@gmail.com>" \
      description="Docker base image for TeX Live"

ENV HOME /root
WORKDIR /root

RUN dnf update -y  \
    && dnf install -y perl wget \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Install latest Tex-Live
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
RUN tar -zxvf install-tl-unx.tar.gz
COPY texlive.profile .
RUN install-*/install-tl --profile=texlive.profile
RUN rm -rf install-tl*

# Export useful Tex-Live paths
ENV PATH /opt/texbin:$PATH
ENV PATH /usr/local/texlive/2021/bin/x86_64-linux:$PATH

# Update Tex-Live and Tex-Live manager to the absolute
RUN tlmgr update --self --all

RUN dnf clean all \
    && rm -rf /var/cache/dnf

WORKDIR /data
VOLUME ["/data"]

