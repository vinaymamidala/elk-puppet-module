class elkvinay (
  $es_main_version        = $::elkvinay::params::es_main_version,
  $kibana_main_version    = $::elkvinay::params::kibana_main_version,
  $logstash_main_version  = $::elkvinay::params::logstash_main_version,
  $enhancers = $::elkvinay::install::enchancers,
  #$package_name           = $::elkvinay::params::package_name,
  #==$es_config              = $::elkstack::params::es_config,
  #==$kibana_config          = $::elkstack::params::kibana_config,
  #==E$logstash_config_input  = $::elkstack::params::logstash_config_input,
  #==E$logstash_config_output = $::elkstack::params::logstash_config_output,
  $with_nginx             = $::elkvinay::params::with_nginx,
) inherits ::elkvinay::params {
  class {'::elkvinay::install': }
  class {'::elkvinay::config': } ~>
  class {'::elkvinay::service': }
  contain '::elkvinay::install'
  contain '::elkvinay::config'
  contain '::elkvinay::service'
}

