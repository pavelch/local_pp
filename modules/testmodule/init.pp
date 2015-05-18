class testmodule {

  augeas { "/tmp/foo.txt":
    incl    => "${destination}",
    lens    => "Properties.lns",
    changes => $changes,
  }

}