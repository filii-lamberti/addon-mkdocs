ARG BUILD_FROM=hassioaddons/base:7.0.3
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

# Copy files necessary for build
COPY requirements.txt /tmp

# Set the temporary build directory
WORKDIR /tmp

# Install requirements for add-on and app dependencies
RUN \
    apk add --no-cache python3=3.6.6-r0 \
    && python3 -m ensurepip \
    && pip3 install -U pip \
    && rm -r /usr/lib/python*/ensurepip \
    && pip3 install -r requirements.txt \
    && rm -rf /tmp/*

# Copy root filesystem
COPY rootfs /

# Set working directory
WORKDIR /share/mkdocs

# Build arugments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="MkDocs" \
    io.hass.description="MkDocs documentation add-on for Hass.io" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="Jorim Tielemans <tielemans.jorim@gmail.com>" \
    org.label-schema.description="MkDocs documentation add-on for Hass.io" \
    org.label-schema.build-date=${BUILD_DATE} \
    org.label-schema.name="MkDocs" \
    org.label-schema.schema-version="1.0" \
    org.label-schema.url="https://addons.community" \
    org.label-schema.usage="https://gitlab.com/tjorim/hassio-addons/blob/master/mkdocs/README.md" \
    org.label-schema.vcs-ref=${BUILD_REF} \
    org.label-schema.vcs-url="https://gitlab.com/tjorim/hassio-addons" \
    org.label-schema.vendor="Filii Lamberti"
