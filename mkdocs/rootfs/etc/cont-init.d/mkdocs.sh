#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: MkDocs
# This files check if all user configuration requirements are met
# ==============================================================================

# Require a mkdocs.yml file
if ! bashio::fs.file_exists "/share/mkdocs/mkdocs.yml"; then
    bashio::exit.nok "The mkdocs.yml file is not found inside /share/mkdocs/"
fi

# Ensure docs directory exists
if ! bashio::fs.directory_exists "/share/mkdocs/docs"; then
    bashio::exit.nok "Nothing to build, the /share/mkdocs/docs directory is empty"
fi
