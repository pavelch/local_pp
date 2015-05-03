class mongodb::configssvr {
  
    file { '/etc/mongod.conf':
      notify  => Service["mongod"],
      content => "
logpath=/var/log/mongodb/mongod.log
logappend=true
fork=true
dbpath=/var/lib/mongo
pidfilepath=/var/run/mongodb/mongod.pid
configsvr=true
"
    }->
    service { "mongod":
        ensure => running,
        enable => true,
    }
    
}