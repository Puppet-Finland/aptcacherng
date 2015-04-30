#
# == Class: aptcacherng::install
#
# Install apt-cacher-ng
#
class aptcacherng::install inherits aptcacherng::params {

    package { 'apt-cacher-ng':
        ensure => present,
        name   => $::aptcacherng::params::package_name,
    }
}
