class profile::base {

# Create sysadmin users & groups
#include users::sysadmin

# Base package installs

        package { "screen":
        ensure => "installed"
        }

        package { "nmap":
        ensure => "installed"
        }

        package { "bind-utils":
        ensure => "installed"
        }

        package { "wget":
        ensure => "installed"
        }

        package { "tree":
        ensure => "installed"
        }

        package { "vim-enhanced":
        ensure => "installed"
        }

        package { "mlocate":
        ensure => "installed"
        }
}
