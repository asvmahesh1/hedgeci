# ae-windows-base-sqlserver cookbook


This cookbook configures a system to be a _standalone_ Chef 12+ Server. It will install the appropriate platform-specific chef-server Omnibus package from Package Cloud and perform the initial configuration related to SQL Server.


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

The attributes used by this cookbook are under the `ae-windows-base-sqlserver` name space.

Attribute      | Description                                                                                                                                                         | Type    | Default
-------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------- | ------------
 |                                                                  |  | 


## Recipes

This section describes the recipes in the cookbook and how to use them in your environment.

### default

This recipe:

- Does nothing right now

###sqlserver_setup

This recipe:

- pulls sqlserver configuration files from s3
- create prepare image setup for sqlserver

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
- aws-kitchen

### Test commands
- Full test scenarios
```
kitchen test
```

- 
## How to Contirbute

- TODO

## License and Authors

- Author: Himmat Singh [Himmat.Singh@aenetworks.com](mailto:Himmat.Singh@aenetworks.com
- Copyright 2017-2018, A+E Television Networks
-