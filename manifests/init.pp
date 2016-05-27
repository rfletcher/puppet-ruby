# == Class: ruby
#
# Installs ruby via rbenv
#
# === Parameters
#
# [*default*]
#
#   Boolean. Make this the system's default ruby version.
#
# [*version*]
#
#   String. The version to install.
#
# [*versions*]
#
#   Hash. One or more name => param pairs to install. Meant for hiera-driven,
#   installations.
#
# === Examples
#
#  class { 'ruby':
#    version => "1.9.3-p327",
#  }
#
# === Authors
#
# Rick Fletcher <fletch@pobox.com>
#
# === Copyright
#
# Copyright 2016 Rick Fletcher
#
class ruby (
  $default  = false,
  $version  = undef,
  $versions = undef,
) {
  include rbenv

  if $version and $versions {
    fail( 'Specify $version or $versions, not both' )
  }

  if $version != "" {
    validate_string( $version )

    if ! is_bool( $default ) {
      fail( 'When specifying $version, $default must be true or false' )
    }

    $real_versions = {
      "${version}" => {
        "default" => $default
      }
    }
  }

  if $versions != "" {
    validate_hash( $versions )

    if $default != false and $default != "" {
      fail( 'When specifying $versions, $default must be omitted (or false)' )
    }

    $real_versions = $versions
  }

  rbenv::plugin { 'sstephenson/ruby-build': } -> Rbenv::Build <| |>

  create_resources( 'rbenv::build', $real_versions )
}
