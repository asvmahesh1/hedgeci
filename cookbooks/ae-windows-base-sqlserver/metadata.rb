name 'ae-windows-base-sqlserver'
maintainer 'A+E Networks'
maintainer_email 'Himmat.Singh@aenetworks.com'
license 'All Rights Reserved'
description 'Installs/Configures ae-windows-base'
long_description 'Installs/Configures ae-windows-base-sqlserver'
version '0.0.1'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/aenetworks-infra/ae-windows-base-sqlserver/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/aenetworks-infra/ae-windows-base-sqlserver'

depends 'windows'
depends 'wsus-client'
depends 'powershell'
depends 'chocolatey'