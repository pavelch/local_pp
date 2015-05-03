# This class installs MongoDB

class mongodb {
  
    $db_dirs = [ "/data/", "/data/configdb"]

    file { "/etc/yum.repos.d/mongodb.repo":
        content => "[mongodb]
name=MongoDB Repository
baseurl=http://downloads-distro.mongodb.org/repo/redhat/os/x86_64
gpgcheck=0
enabled=1
",
    } ->

    package { "mongodb-org":
        provider => 'yum',
        ensure   => installed,
    } ->
    
    file { $db_dirs:
      ensure => directory,
      owner => mongod,
    } 
}

