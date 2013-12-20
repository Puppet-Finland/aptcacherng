#
# == Class: aptcacherng::service
#
# Configures aptcacherng to start on boot
#
class aptcacherng::service {

    include aptcacherng::params

    service { 'apt-cacher-ng':
        name => "${::aptcacherng::params::service_name}",
        enable => true,
        require => Class['aptcacherng::install'],
    }
}
