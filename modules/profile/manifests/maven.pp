class profile::maven {
  class { "maven::maven":
    version => "3.3.3"
  }
}
