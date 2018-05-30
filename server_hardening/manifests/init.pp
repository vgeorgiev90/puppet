# Class: server_hardening
# ===========================
#
# Full description of class server_hardening here.
#
# Parameters
# ----------
#
# Document parameters here.
#
# * `sample parameter`
# Explanation of what this parameter affects and what it defaults to.
# e.g. "Specify one or more upstream ntp servers as an array."
#
# Variables
# ----------
#
# Here you should define a list of variables that this module would require.
#
# * `sample variable`
#  Explanation of how this variable affects the function of this class and if
#  it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#  External Node Classifier as a comma separated list of hostnames." (Note,
#  global variables should be avoided in favor of class parameters as
#  of Puppet 2.6.)
#
# Examples
# --------
#
# @example
#    class { 'server_hardening':
#      servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#    }
#
# Authors
# -------
#
# Author Name <author@domain.com>
#
# Copyright
# ---------
#
# Copyright 2018 Your name here, unless otherwise noted.
#
class server_hardening(
) {
    if $facts['os']['name'] == 'CentOS' and $facts['os']['release']['major'] == '7' {
      class { '::server_hardening::security_packages': }
      class { '::server_hardening::malware_detect': }
      class { '::server_hardening::ossec_ids': }
      class { '::server_hardening::kernel_secure': }
      class { '::server_hardening::extra_shell_security': }
      class { '::server_hardening::secure_ssh': }
      class { '::server_hardening::firewall': }
    } else {
      notify { 'For the moment this module works only for CentOS 7': }
    }
}



