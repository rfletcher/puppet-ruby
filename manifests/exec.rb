# # == Define: ruby::exec
# #
# # Executes a command via `rbenv exec`
# #
# # === Parameters
# #
# # [*creates*]
# #
# #   String. A file path created by this command.
# #
# # [*version*]
# #
# #   String. Ruby version. If omitted ruby::version will be used.
# #
# # === Examples
# #
# #  ruby::exec { 'bundle install':
# #    version => "1.9.3-p327",
# #  }
# #
# # === Authors
# #
# # Rick Fletcher <fletch@pobox.com>
# #
# # === Copyright
# #
# # Copyright 2014 Rick Fletcher
# #
# define ruby::exec (
#   $creates = '',
#   $version,
# ) {
#   exec { "rbenv exec ${title}":
#     creates     => $creates,
#     environment => "RBENV_VERSION=${version}",
#   }
# }
