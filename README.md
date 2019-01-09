# aptcacherng

A Puppet module for managing apt-cacher-ng

# Module usage

Simple usage:

    include ::aptcacherng

Customize listen address and limit (with iptables) the IP ranges:

    class { '::aptcacherng':
      listen_addresses   => ['localhost', 'apt.example.org'],
      allow_address_ipv4 => '10.182.130.0/24',
    }
