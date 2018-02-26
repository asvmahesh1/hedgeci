# ae-windows-base cookbook


This cookbook configures a system to be a _standalone_ Chef 12+ Server. It will install the appropriate platform-specific chef-server Omnibus package from Package Cloud and perform the initial configuration.


## Requirements

### Platforms

- Windows 2012 R2


### Chef

- Chef 12.5+

### Cookbooks

- windows
- wsus-client
- powershell
- chocolatey

## Attributes

The attributes used by this cookbook are under the `ae-windows-base` name space.

Attribute      | Description                                                                                                                                                         | Type    | Default
-------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ------------
 |                                                                  |  | 


## Recipes

This section describes the recipes in the cookbook and how to use them in your environment.

### default

This recipe:

- Does nothing right now

### mcafee

This recipe:

- Pulls Compressed MCAfee files from web
- Extracts files to disk

TODO:

- Automate the installation of MCAfee

### bit9

### chocolatey_packages
- Installs Notepad++
- Installs Powershellv5

## Testing and Deployment Methods

### Testing Requirements
- Chef Dk
- Vagrant
- Virtual Box

### Test commands
- Full test scenarios
```
kitchen test
```

- 
## How to Contirbute

- TODO

## License and Authors

- Author: Kevin Keeler [Kevin.Keeler@aenetworks.com](mailto:Kevin.Keeler@aenetworks.com
- Copyright 2016-2017, A+E Television Networks
-