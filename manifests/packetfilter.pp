#
# == Class aptcacherng::packetfilter
#
# Configures packetfiltering rules for apt-cacher-ng
#
class aptcacherng::packetfilter(
    $allow_address_ipv4,
    $allow_address_ipv6,
    $port
)
{
    # IPv4 rules
    firewall { '009 ipv4 accept apt-cacher-ng':
        provider => 'iptables',
        chain  => 'INPUT',
        proto => 'tcp',
        # Set the allowable source address, unless 'any', in which case the 
        # 'source' parameter is left undefined.
        source => $allow_address_ipv4 ? {
            'any' => undef,
            default => $allow_address_ipv4,
        },
        dport => $port,
        action => 'accept',
    }

    # IPv6 rules
    firewall { '009 ipv6 accept apt-cacher-ng':
        provider => 'ip6tables',
        chain  => 'INPUT',
        proto => 'tcp',
        source => $allow_address_ipv6 ? {
            'any' => undef,
            default => $allow_address_ipv6,
        },
        dport => $port,
        action => 'accept',
    }
}
