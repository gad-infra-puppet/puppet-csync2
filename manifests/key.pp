# Define: csync2::key
#
# Simple definition to manage pre-created csync2 key files.
#
# Sample Usage :
#  csync2::key { 'group1':
#    source => 'puppet://modules/mymodule/csync2/group1.key',
#  }
#
define csync2::key (
  $source  = undef,
  $content = undef,
  $ensure  = undef
) {

  $filename = $title ? {
    'MAIN'  => "csync2.key",
    default => "csync2_${title}.key",
  }

  file { "${csync2::csync2_confdir}/${filename}":
    source  => $source,
    content => $content,
    owner   => 'root',
    group   => 'root',
    mode    => '0600',
    require => Package['csync2'],
    ensure  => $ensure,
  }

}

