class role::developer {
  include profile
  include profile::firewall
  include apache
  include java
  include profile::basic
#  include profile::maven
  include profile::rubydev
  include profile::aws

  Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

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
  # create repo with sha1 preventing checksum failure
  exec { "createrepo -d -s sha1 /var/www/html/": }

}