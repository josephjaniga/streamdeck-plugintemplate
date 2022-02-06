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

### TODO

- Automate plugin installation
- Automate plugin uninstallation each build so they can be installed again