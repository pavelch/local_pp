class profile::basic inherits profile {
  include apache
  include java

#  file { "/vagrant/Downloads/www":
#    ensure => directory
#  }->
#  apache::vhost { 'first.example.com':
#    port    => '80',
#    docroot => '/vagrant/Downloads/www',
#  }

  package { "createrepo":
    ensure => installed,
    provider => 'yum'
  }

  package { "wget":
    ensure => installed,
    provider => 'yum'
  }

  file { "/root/.aws":
    ensure => directory
  }->
  exec { "cp /vagrant/.aws/credentials /root/.aws/credentials": }->
  exec { "dos2unix /root/.aws/credentials": }
  package { 'aws-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }

}