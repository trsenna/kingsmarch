# [Choice] Debian version: trixie, bookworm
ARG VARIANT="trixie"
FROM buildpack-deps:${VARIANT}-curl

# Set locale so Unicode characters render correctly in locale-aware tools (e.g. tmux).
ENV LANG=C.UTF-8

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends \
    dnsutils \
    iputils-ping \
    ripgrep \
    wl-clipboard \
    xclip  \
    xsel \
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
