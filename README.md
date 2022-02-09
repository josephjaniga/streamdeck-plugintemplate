# streamdeck-plugintemplate

The purpose of this repo was to document my scripting and automation process of creating new streamdeck plugins.  I wanted to be able to quickly create new template projects, as well as quickly build / install / integration test those projects.

---

## `npm run setup`

This command will prepare you project for development from the starter template:
 - If needed: downloads the DistributionTool.zip and unpacks it (for windows) to ./bin
 - Prompts the user for a plugin identifier (com.elgato.template)
 - Creates the Sources directory based off of the template
 - Search replaces the provided plugin identifier throughout the template
 - Creates a `build.target` file in the ./Scripts directory... This file simply keeps track of your project identifier 

---

## `npm run build`

This command will utilize the `build.target` value created in setup and use the obtained DistributionTool.exe to create a release of your plugin.

---

## Debugging

- On Windows, you will need to add a DWORD html_remote_debugging_enabled with value 1 in the registry @ HKEY_CURRENT_USER\Software\Elgato Systems GmbH\StreamDeck.

http://localhost:23654/

---

## TODO

- Automate plugin installation
  - the challenge here is the plugin installation seems to be gated by a manual click action of "accept this installtion".
  - currently my automation will execute the plugin binary, but the user needs to click to confirm.
- ~~Automate plugin uninstallation each build so they can be installed again~~