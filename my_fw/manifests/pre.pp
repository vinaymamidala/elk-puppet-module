class my_fw::pre {
  Firewall {
    require => undef,
  }
   # Default firewall rules
  firewall { '000 accept all icmp':
    proto  => 'icmp',
    action => 'accept',
  }->
  firewall { '001 accept all to lo interface':
    proto   => 'all',
    iniface => 'lo',
    action  => 'accept',
  }->
  firewall { '002 reject local traffic not on loopback interface':
    iniface     => '! lo',
    proto       => 'all',
    destination => '127.0.0.1/8',
    action      => 'reject',
  }->
  firewall { '003 accept related established rules':
    proto  => 'all',
    state  => ['RELATED', 'ESTABLISHED'],
    action => 'accept',
  }->
  firewall { '004 allow ssh from wbx':
    dport  => '22',
    proto  => 'tcp',
    source => '54.85.13.118',
    action => 'accept',
  }->
  firewall { '005 allow ssh from NY Office primary IP':
    dport  => '22',
    proto  => 'tcp',
    source => '172.85.53.210',
    action => 'accept',
  }->
  firewall { '006 allow ssh from India office':
    dport  => '22',
    proto  => 'tcp',
    source => '115.113.77.105',
    action => 'accept',
  }->
  firewall { '007 allow ssh from AR':
    dport  => '22',
    proto  => 'tcp',
    source => '24.190.99.139',
    action => 'accept',
  }->
  firewall { '008 allow ssh from AR2':
    dport  => '22',
    proto  => 'tcp',
    source => '54.243.240.118',
    action => 'accept',
  }->
  firewall { '009 allow ssh from NYC office secondary IP':
    dport  => '22',
    proto  => 'tcp',
    source => '108.176.17.38',
    action => 'accept',
  }->
  firewall { '010 allow ssh from ansible-controller node':
    dport  => '22',
    proto  => 'tcp',
    source => '45.79.139.208',
    action => 'accept',
  }->
  firewall { '011 allow ssh from cms.cobaltvps.com':
    dport  => '22',
    proto  => 'tcp',
    source => '45.79.159.14',
    action => 'accept',
  }->
  firewall { '012 accept ssh connections from AR work jump box':                                                                                  
    dport   => '22',       
    proto  => 'tcp',
    source => '54.243.240.118',
    action => 'accept',                                                                                                                           
  } 
}
