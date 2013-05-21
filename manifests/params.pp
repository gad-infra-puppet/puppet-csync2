class csync2::params {
  case $::operatingsystem {
    centos:  { $csync2_confdir = '/etc/csync2' }
    default: { $csync2_confdir = '/etc'        }
  }
}