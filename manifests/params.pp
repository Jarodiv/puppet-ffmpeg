# Class: ffmpeg::params
#
# this class manages aem default parameters

class ffmpeg::params {
  # <OS family handling>
  case $::osfamily {
    'RedHat': {
      $base_package  = 'ffmpeg'
      $devel_package = 'ffmpeg-devel'

      case $::operatingsystem {
        'RedHat', 'CentOS': {
          case $::operatingsystemmajrelease {
            # RHEL 6 family
            '6': {
              $nux_repo = 'https://li.nux.ro/download/nux/dextop/el6/x86_64/'
            }
            # RHEL 6 family
            '7': {
              $nux_repo = 'https://li.nux.ro/download/nux/dextop/el7/x86_64/'
	            $nux_rpm = 'nux-dextop-release-0-5.el7.nux.noarch.rpm'
            }
            default: {
              fail("Unsupported platform: ${module_name} currently doesn't support ${::operatingsystem} ${::operatingsystemmajrelease}")
            }
          }
        }
        # Amazon Linux
        'Amazon': {
          $nux_repo = 'https://li.nux.ro/download/nux/dextop/el7/x86_64/'
	        $nux_rpm = 'nux-dextop-release-0-5.el7.nux.noarch.rpm'
        }
        default: {
          fail("Unsupported platform: ${module_name} currently doesn't support ${::operatingsystem}")
        }
      }
    }
    default: {
      fail("Unsupported platform: ${module_name} currently doesn't support ${::osfamily}")
    }
  }
  # </ OS family handling>

  $package_ensure ='present'
  $include_devel  = false
}
