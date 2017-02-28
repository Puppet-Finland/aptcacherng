#
# == Class aptcacherng::packetfilter
#
# Configures packetfiltering rules for apt-cacher-ng
#
class aptcacherng::packetfilter
(
    $allow_address_ipv4,
    $allow_address_ipv6,
    $port

) inherits aptcacherng::params
{

    $source_v4 = $allow_address_ipv4 ? {
        'any'   => undef,
        default => $allow_address_ipv4,
    }

    $source_v6 = $allow_address_ipv6 ? {
        'any'   => undef,
        default => $allow_address_ipv6,
    }

    # IPv4 rules
    @firewall { '009 ipv4 accept apt-cacher-ng':
        provider => 'iptables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v4,
        dport    => $port,
        action   => 'accept',
        tag      => 'default',
    }

    # IPv6 rules
    @firewall { '009 ipv6 accept apt-cacher-ng':
        provider => 'ip6tables',
        chain    => 'INPUT',
        proto    => 'tcp',
        source   => $source_v6,
        dport    => $port,
        action   => 'accept',
        tag      => 'default',
    }
}
