class profile::elkserver{
include my_fw
include sudo


class yumconfig {

  class { 'yum':
    config_options    => {
      gpgcheck    => true,
      debuglevel  => 5,
    },
  }

  yum::config { 'plugins':
    ensure => 0,
  }

}

file{'/puppetagent_run_time.txt':
    ensure  =>  'present',
    content  =>  inline_template("Created by Puppet at <%= Time.now %>\n"),
  }

  exec { "Selinux in permissive mode":
    command => "/usr/sbin/setenforce 0",
    unless => "/usr/sbin/getenforce |grep Permissive",
  }


include elkvinay

}
