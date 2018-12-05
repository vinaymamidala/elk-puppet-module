# == Class elkvinay::params
#
# This class is meant to be called from elkstack.
# It sets variables according to platform.
#
class elkvinay::params {
  $es_main_version        = '6.x'
  
  $kibana_main_version    = '6.x'
 
  #$logstash_config_output = {
  #  '30-elasticsearch' => [
   #   'hosts           => ["localhost:9200"]',
   #   'sniffing        => true',
   #   'manage_template => false',
#         'index => "%{[@metadata][beat]}-%{+YYYY.MM.dd}"',
#      'document_type => "%{[@metadata][type]}"',
#    ],
  #}
  $logstash_main_version  = '6.x'

  $package_name           = [ 'java', 'elasticsearch', 'logstash', 'kibana' ]

  #$plugins                = {
  #  elasticsearch => ['license', 'marvel-agent'],
  #  logstash      => ['logstash-input-jdbc'],
  #  kibana        => ['elasticsearch/marvel/latest', 'elastic/sense'],
  # drivers       => [],
  #}
  $service_name           = [ 'elasticsearch', 'kibana', 'logstash' ]
  $with_nginx             = true

}
