#
# == Class: aptcacherng::install
#
# Install apt-cacher-ng
#
class aptcacherng::install {

    include aptcacherng::params

    package { 'apt-cacher-ng':
        name => "${::aptcacherng::params::package_name}",
        ensure => present,
    }
}
