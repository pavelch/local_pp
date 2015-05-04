class profile::aws {
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
}