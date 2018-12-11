# == Class elkvinay::config
#
# This class is called from elkstack for service config.
#
class elkvinay::config (
  $es_config              = $::elkvinay::es_config,
  $kibana_config          = $::elkvinay::kibana_config,
  #$logstash_config_output = $::elkstack::logstash_config_output,
  #$logstash_config_input  = $::elkstack::logstash_config_input,
  $with_nginx             = $::elkvinay::with_nginx,
){
  if $with_nginx {
    file {'kibana nginx config':
      ensure  => file,
      content => template('elkvinay/kibana.nginx.conf.erb'),
      path    => '/etc/nginx/conf.d/kibana.conf',
      #content => template('elkvinay/nginx.conf.erb'),
      #path    => '/etc/nginx/nginx.conf',
      notify  => Service['nginx'],
    }
    file {'kibana default config':
      ensure => file,
      replace => true,
      content => template('elkvinay/nginx.conf.erb'),
      path => '/etc/nginx/nginx.conf',
      notify  => Service['nginx'],
    }
  }
}
  #file_line { 'elasticsearch url for kibana':
  #  ensure => present,
    #Eline   => 'elasticsearch.url: "http://localhost:9200"',
    #Epath   => '/opt/kibana/config/kibana.yml',
   # path  => '/etc/kibana/kibana.yml',
   # notify => Service['kibana'],
 # }

  #$kibana_config.each |String $line| {
   # file_line { $line:
   #   ensure => present,
   #   line   => $line,
      #Epath   => '/opt/kibana/config/kibana.yml',
     #Epath  => '/etc/kibana/kibana.yml',
    #  notify => Service['kibana'],
    #}
 # }
 # $es_config.each |String $line| {
  #  file_line { $line:
   #   ensure => present,
    #  line   => $line,
      #Epath   => '/etc/elasticsearch/elasticsearch.yml',
      #Enotify => Service['elasticsearch'],
  #  }
 # }
 # if ($logstash_config_input != '') {
  #  $logstash_config_input.each |$conf_file, $contents| {
      #Efile { "/etc/logstash/conf.d/${conf_file}-input.conf":
        #Eensure  => present,
       #E content => template('elkstack/logstash.input.conf.erb'),
  #    }
  #3}
  #if ($logstash_config_output != '') {
  #  $logstash_config_output.each |$conf_file, $contents| {
  #    file { "/etc/logstash/conf.d/${conf_file}-output.conf":
   #     ensure  => present,
   #     content => template('elkstack/logstash.output.conf.erb'),
   #   }
   # }
 # }
#}

