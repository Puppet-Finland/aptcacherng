#
# == Class: aptcacherng::service
#
# Configures apt-cacher-ng to start on boot
#
class aptcacherng::service inherits aptcacherng::params {

    service { 'apt-cacher-ng':
        name    => $::aptcacherng::params::service_name,
        enable  => true,
        require => Class['aptcacherng::install'],
    }
}
