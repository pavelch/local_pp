class profile::firewall {

  resources { "firewall":
    purge => true
  } ->
  firewall { "000 accept all icmp requests":
    proto  => "icmp",
    action => "accept",
  } ->
  firewall { "006 Allow inbound SSH":
    port     => 22,
    proto    => tcp,
    action   => accept,
  } ->
  firewall { '100 allow http and https access':
    port   => [80, 443],
    proto  => tcp,
    action => accept,
  }
}