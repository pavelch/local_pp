class profile::apachebasic {
  include apache
  apache::vhost { 'first.example.com':
    port    => '80',
    docroot => '/vagrant/Downloads/',
  }
}