class profile::developer {
  package { "createrepo":
    ensure => installed,
    provider => 'yum'
  }
}