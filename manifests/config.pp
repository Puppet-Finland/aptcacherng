#
# == Class: aptcacherng::config
#
# Configure apt-cacher-ng
#
class aptcacherng::config
(
    $listen_addresses,
    $port
)
{

    include aptcacherng::params

    file { 'acng.conf':
        name => "${::aptcacherng::params::config_name}",
        ensure => present,
        content => template('aptcacherng/acng.conf.erb'),
        owner => root,
        group => root,
        mode => 644,
        require => Class['aptcacherng::install'],
        notify => Class['aptcacherng::service'],
    }
}
