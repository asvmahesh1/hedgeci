name 'ae-windows-base'
maintainer 'A+E Networks'
maintainer_email 'kevin.keeler@aenetworks.com'
license 'All Rights Reserved'
description 'Installs/Configures ae-windows-base'
long_description 'Installs/Configures ae-windows-base'
version '0.1.0'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/aenetworks-infra/ae-windows-base-chef/issues'

# The `source_url` points to the development reposiory for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/aenetworks-infra/ae-windows-base-chef'

depends 'windows'
depends 'wsus-client'
depends 'powershell'
depends 'chocolatey'
depends 'windows-hardening'

