# This module installs FFmpeg
#
# @param include_devel
#     Whether the Development package for ffmpeg or not.
class ffmpeg (
  Boolean $include_devel = lookup('ffmpeg::include_devel'),
) {
  # ============================================================================ #
  # Hiera lookups                                                                #
  # ============================================================================ #

  $base_package = lookup('ffmpeg::base_package', { value_type => String })
  $devel_package = lookup('ffmpeg::devel_package', { value_type => String })


  # ============================================================================ #
  # Code                                                                         #
  # ============================================================================ #

  # <OS family handling>
  case $facts['os']['name'] {
    'CentOS': {
      case $facts['os']['release']['major'] {
        '7', '8': {
          include epel

          # See: https://linuxize.com/post/how-to-install-ffmpeg-on-centos-8/
          yumrepo { 'epel-multimedia':
            ensure              => present,
            baseurl             => 'https://negativo17.org/repos/multimedia/epel-$releasever/$basearch/',
            descr               => 'negativo17 - Multimedia',
            enabled             => 1,
            gpgkey              => 'https://negativo17.org/repos/RPM-GPG-KEY-slaanesh',
            gpgcheck            => 1,
            repo_gpgcheck       => 0,
            skip_if_unavailable => 1,
          }

          # The available ffmpeg version is dynamically linked against libSDL which is provided by the package 'SDL2' from this repo
          if ($facts['os']['release']['major'] == '8') {
            $install_options = [ '--enablerepo', 'powertools' ]
          }
        }
        default: {
          fail("Unsupported platform: ${module_name} currently doesn't support ${facts['os']['name']} ${facts['os']['release']['major']}")
        }
      }
    }
    default: {
      fail("Unsupported platform: ${module_name} currently doesn't support ${facts['os']['name']}")
    }
  }
  # </ OS family handling>

  if $include_devel {
    $packages = [ $base_package, $devel_package ]
  } else {
    $packages = [ $base_package ]
  }

  package { $packages:
    install_options => defined('$install_options') ? { true => $install_options, default => undef },
  }
}
