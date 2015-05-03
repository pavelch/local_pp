class profile::basic inherits profile {
  include apache
  include java



  package { "createrepo":
    ensure => installed,
    provider => 'yum'
  }

  package { "wget":
    ensure => installed,
    provider => 'yum'
  }->
  package { 'pry':
    ensure   => 'installed',
    provider => 'gem',
  }->
  file { "/root/.aws":
    ensure => directory
  }->
  package { 'aws-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

  exec { "cp /vagrant/.aws/credentials /root/.aws/credentials": }->
  exec { "dos2unix /root/.aws/credentials": }

  file { '/etc/yum.repos.d/local.repo':
    content => "
[local]
name=Local Repository
baseurl=http://127.0.0.1/
enabled=0
gpgcheck=0
    "
  }->
  exec { "createrepo /var/www/html/": }

}