class profile {
  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

  package { "dos2unix":
    ensure => installed,
    provider => yum
  }

}