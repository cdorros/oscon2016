# install packages required for our oscon demo app
#
class app::packages {

  package { 'nginx':
    ensure => 'latest',
  }

  service { 'nginx':
    ensure => 'running',
  }

}
