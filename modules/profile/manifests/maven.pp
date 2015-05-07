class profile::maven {
  include profile

  exec { "curl -O http://apache.mivzakim.net/maven/maven-3/3.3.3/binaries/apache-maven-3.3.3-bin.tar.gz": }->
  exec { "mv apache-maven-3.3.3 /opt/": }->
  file { '/usr/bin/mvn':
    ensure => link,
    target => "/opt/apache-maven-3.3.3/bin/mvn"
  }->
  file { "/etc/profile.d/maven.sh":
    content => "
#!/bin/bash
MAVEN_HOME=/opt/maven
PATH=$MAVEN_HOME/bin:$PATH
export PATH MAVEN_HOME
export CLASSPATH=.
    "
  }
}
