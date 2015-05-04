class profile::basic inherits profile {

  package { "wget":
    ensure => installed,
    provider => 'yum'
  }





}