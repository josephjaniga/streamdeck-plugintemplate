#!/bin/bash

# This script clears the appdata roaming and local directories
# looking for the plugin defined in the build.target file
# created in setup.

execution_directory=$(pwd)

target=`cat ./Scripts/build.target`

# clean up the directories
appdata_roaming_directory=~/AppData/Roaming/Elgato/StreamDeck/Plugins/
cd "${appdata_roaming_directory}"
if [ -d "./${target}.sdPlugin/" ]; then
  rm -rf "./${target}.sdPlugin/"
fi

appdata_local_directory=~/AppData/Local/Elgato/Stream\ Deck/
cd "${appdata_local_directory}"
if [ -d "./cache/QtWebEngine/${target}/" ]; then
  rm -rf "./cache/QtWebEngine/${target}/"
fi
if [ -d "./QtWebEngine/${target}/" ]; then
  rm -rf "./QtWebEngine/${target}/"
fi

# delete the build
cd "${execution_directory}"
rm -f ./Release/${target}.streamDeckPlugin

sleep 1