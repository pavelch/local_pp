class profile::firewall {

  firewall { "000 accept all icmp requests":
    proto  => "icmp",
    action => "accept",
  } ->
  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }
}