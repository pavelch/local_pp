class profile::apachebasic {
  apache::vhost { 'first.example.com':
    port    => '80',
    docroot => '/vagrant/Downloads/',
  }
}