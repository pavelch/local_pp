class profile::rubydev {

  package { 'nokogiri':
    ensure   => 'installed',
    provider => 'gem',
  }
}