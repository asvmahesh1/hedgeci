# # encoding: utf-8

# Inspec test for recipe ae-windows-base-sqlserver::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('C:\\Program Files\\Notepad++') do
 it { should exist }
end
