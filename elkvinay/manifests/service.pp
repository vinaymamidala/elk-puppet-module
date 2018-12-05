class elkvinay::service {

service { "elasticsearch":
  ensure => running,
  enable => true,
}

service { "logstash":
  ensure => running,
  enable => true,
}

service { "kibana":
  ensure => running,
  enable => true,
}

#file { '/etc/nginx/nginx.conf':
#        ensure => present,
#        source => 'puppet:///modules/elkserver/nginx.conf',
#        before => Service[ 'nginx' ],
#                }
service { "nginx":
  ensure => running,
  enable => true,
}
}

