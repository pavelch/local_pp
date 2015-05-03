# This class installs MongoDB

class mongodb {
  
    $db_dirs = [ "/data/", "/data/configdb"]

    file { "/etc/yum.repos.d/mongodb.repo":
        content => "
[mongodb-org-3.0]
name=MongoDB Repository
baseurl=http://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.0/x86_64/
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

