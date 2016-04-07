# Author::    Liam Bennett (mailto:lbennett@opentable.com)
# Copyright:: Copyright (c) 2013 OpenTable Inc
# License::   MIT

# == Class puppetversion::params
#
# This private class is meant to be called from `puppetversion`
# It sets variables according to platform
#
class puppetversion::params {

  $version             = '3.4.2'
  $proxy_address       = ''
  $download_source     = 'https://downloads.puppetlabs.com/windows'
  $time_delay          = 3
  $install_opts        = undef
  $ruby_augeas_version = '0.5.0'

  case $::is_pe {
    true: {
      $package_windows = "puppet-enterprise-${version}.msi"
      $version_fact    = $::pe_version
    }
    default: {
      $package_windows = "puppet-${version}.msi"
      $version_fact    = $::puppetversion
    }
  }
}
