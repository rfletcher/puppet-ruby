# == Class: ruby
#
# Installs ruby via rbenv
#
# === Parameters
#
# [*version*]
#
#   String. The version to install.
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
# Copyright 2014 Rick Fletcher
#
class ruby (
  $version,
) {
  include rbenv

  rbenv::plugin { 'sstephenson/ruby-build': }
  rbenv::build { $version: }
}
