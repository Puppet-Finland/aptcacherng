#
# == Class: aptcacherng::params
#
# Defines some variables based on the operating system
#
class aptcacherng::params {

    case $::osfamily {
        'Debian': {
            $package_name = 'apt-cacher-ng'
            $config_name = '/etc/apt-cacher-ng/acng.conf'
            $service_name = 'apt-cacher-ng'
            $service_start = "/usr/sbin/service ${service_name} start"
            $service_stop = "/usr/sbin/service ${service_name} stop"
            $process_match = '^/usr/sbin/apt-cacher-ng'
        }
        default: {
            fail("Unsupported operating system ${::osfamily}")
        }
    }
}
