class my_fw::http {
  firewall { '150 allow http on 80':
    dport   => [80],
    proto  => tcp,
    action => accept,
  }
}
