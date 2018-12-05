# == Class elkvinay::install
#
# This class is called from elkstack for install.
#
class elkvinay::install(
  $logstash_main_version = $::elkvinay::logstash_main_version,
  $es_main_version = $::elkvinay::es_main_version,
  $kibana_main_version = $::elkvinay::kibana_main_version,
  #$package_name = $::elkvinay::package_name,
) {

  exec { 'import elk key':
    command => '/usr/bin/rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch',
    creates => '/etc/pki/rpm-gpg/GPG-KEY-elasticsearch',
    unless  => "rpm -q gpg-pubkey --qf '%{summary}\n' | grep -qi elasticsearch",
    path    => '/usr/bin',
  } ->

  file { 'elk repo':
    ensure  => file,
    path    => '/etc/yum.repos.d/elk.repo',
    content => template('elkvinay/elk.repo.erb'),
  }

 $enhancers = [ 'java', 'elasticsearch', 'kibana', 'logstash', 'nginx', 'httpd-tools' ]
  package { $enhancers: ensure => 'installed' }
 
  #package { $::elkstack::params::package_name:
  #  ensure  => present,
  #  require => [ Exec['import elk key'] ],
  #}
  if $::elkstack::with_nginx {
    package { 'nginx':
      ensure => present,
    }
    package { 'httpd-tools':
     ensure => present,
   }
  }
}

