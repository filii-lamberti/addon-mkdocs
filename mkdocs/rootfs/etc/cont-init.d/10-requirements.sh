#!/usr/bin/with-contenv bash
# ==============================================================================
# Community Hass.io Add-ons: MkDocs
# This files check if all user configuration requirements are met
# ==============================================================================
# shellcheck disable=SC1091
source /usr/lib/hassio-addons/base.sh

# Require a mkdocs.yml file
if ! hass.file_exists "/share/mkdocs/mkdocs.yml"; then
    hass.die 'The mkdocs.yml file is not found inside /share/mkdocs/'
fi

# Ensure docs directory exists
if ! hass.directory_exists "/share/mkdocs/docs"; then
    hass.die 'Nothing to build, the /share/mkdocs/docs directory is empty'
fi
