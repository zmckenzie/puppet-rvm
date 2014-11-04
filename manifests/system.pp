class rvm::system($version='latest') {
  exec { 'system-rvm':
    path    => '/usr/bin:/usr/sbin:/bin',
    command => "bash -c '/usr/bin/curl -s https://raw.githubusercontent.com/wayneeseguin/rvm/master/binscripts/rvm-installer -o /tmp/rvm-installer ; \
                chmod +x /tmp/rvm-installer ; \
                gpg --keyserver hkp://keys.gnupg.net --recv-keys D39DC0E3 && \
                rvm_bin_path=/usr/local/rvm/bin rvm_man_path=/usr/local/rvm/man /tmp/rvm-installer --version ${version}  --autolibs=enable; \
                rm /tmp/rvm-installer'",
    creates => '/usr/local/rvm/bin/rvm',
    require => [
      Class['rvm::dependencies'],
    ],
  }
}
