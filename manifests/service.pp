# @api private
#
# This class is meant to be called from samba to manage smb and nmb services
#
class samba::service {
  assert_private('samba::service is a private class')

  $service_nmb_name = $facts['os']['family'] ? {
    'RedHat' => 'nmb',
    'Debian' => 'nmbd',
  }

  $service_smb_name = $facts['os']['family'] ? {
    'RedHat' => 'smb',
    'Debian' => 'smbd',
  }

  service { $service_nmb_name:
    ensure     => $::samba::service_nmb_ensure,
    enable     => $::samba::service_nmb_enable,
    hasstatus  => true,
    hasrestart => true,
  }
  service { $service_smb_name:
    ensure     => $::samba::service_smb_ensure,
    enable     => $::samba::service_smb_enable,
    hasstatus  => true,
    hasrestart => true,
  }
}
