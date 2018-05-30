# Class: my_apache
# ===========================
#
# Full description of class my_apache here.
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
#    class { 'my_apache':
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
class my_apache(
  $package_name = $::my_apache::params::package_name,
  $service_name = $::my_apache::params::service_name,
  $vhostdir     = $::my_apache::params::vhostdir,
  $phpversion   = $::my_apache::params::phpversion,
) inherits my_apache::params {

  class { '::my_apache::install': }
  -> class { '::my_apache::php_fpm': }
  -> class { '::my_apache::vhost_create': }
  -> class { '::my_apache::service': }


}
