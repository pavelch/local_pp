class mongodb::master {
  
    $configsvr1_ip = hiera('configsvr1::ip')
    $configsvr2_ip = hiera('configsvr2::ip')
    $configsvr3_ip = hiera('configsvr3::ip')
    
    $shardsvr1_ip = hiera('shardsvr1::ip')
    $shardsvr2_ip = hiera('shardsvr2::ip')
    $shardsvr3_ip = hiera('shardsvr3::ip')
        
    file { '/etc/mongod.conf':
      content => "
systemLog:
   destination: file
   path: \"/var/log/mongodb/mongod.log\"
   logAppend: true
processManagement:
   fork: true  
sharding:
    configDB: \"${configsvr1_ip}:27019,${configsvr2_ip}:27019,${configsvr3_ip}:27019\"
    autoSplit: true
"
    }->
    file {'/tmp/addShards.js':
      content => "
db = connect(\"127.0.0.1:27017/admin\");
foo = sh.addShard(\"${shardsvr1_ip}:27018\");
bar = sh.addShard(\"${shardsvr2_ip}:27018\");
baz = sh.addShard(\"${shardsvr3_ip}:27018\");
"      
    }->
    exec { "mongos":
      command => "/usr/bin/mongos -f /etc/mongod.conf",
    }->
    exec { "addShard":
      command => "/usr/bin/mongo /tmp/addShards.js",
    }
    
}