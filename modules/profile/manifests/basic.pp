class profile::basic {
  include apache
  apache::vhost { 'first.example.com':
    port    => '80',
    docroot => '/vagrant/Downloads/',
  }

  file { ".aws":
    ensure => directory
  }->
  exec { "cp /vagrant/.aws/credentials /root/.aws/": }->
  exec { "dos2unix /root/.aws/credentials": }
  package { 'aws-sdk':
    ensure   => 'installed',
    provider => 'gem',
  }


  Class ['apache'] -> Class ['apache::vhost']

}