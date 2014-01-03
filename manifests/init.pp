#
# == Class: aptcacherng
#
# Setup apt-cacher-ng, an apt repository proxy server
#
# == Parameters
#
# [*listen_addresses*]
#   A space-separated list of IP address to listen on (see "BindAddress" in 
#   apt-cacher-ng documentation). For example '0.0.0.0', 'server.domain.com' or 
#   'localhost'. Defaults to 'localhost'
# [*port*]
#   The TCP port to listen on. Defaults to 3142.
# [*allow_address_ipv4*]
#   IPv4 address or address range to allow connections from. Defaults to 
#   '127.0.0.1'.
# [*allow_address_ipv6*]
#   IPv4 address or address range to allow connections from. Defaults to '::1'.
# [*monitor_email*]
#   Email address where local service monitoring software sends it's reports to. 
#   Defaults to global variable $::servermonitor.
#
# == Examples
#
# include aptcacherng
#
# == Authors
#
# Samuli Seppänen <samuli@openvpn.net>
#
# == License
#
# BSD-lisence
# See file LICENSE for details
#
class aptcacherng
(
    $listen_addresses = 'localhost',
    $port = 3142,
    $allow_address_ipv4 = '127.0.0.1',
    $allow_address_ipv6 = '::1',    
    $monitor_email = $::servermonitor
)
{

# Rationale for this is explained in init.pp of the sshd module
if hiera('manage_aptcacherng', 'true') != 'false' {

    include aptcacherng::install

    class { 'aptcacherng::config':
        listen_addresses => $listen_addresses,
        port => $port,
    }

    include aptcacherng::service

    if tagged('monit') {
        class { 'aptcacherng::monit':
            monitor_email => $monitor_email,
        }
    }

    if tagged('packetfilter') {

        class { 'aptcacherng::packetfilter':
            allow_address_ipv4 => $allow_address_ipv4,
            allow_address_ipv6 => $allow_address_ipv6,
            port => $port,
        }
    }

}
}
