class my_fw::https {
  firewall { '151 allow http on 443':
    dport   => [443],
    proto  => tcp,
    action => accept,
  }
}
