class ol8nfs::server::ubuntu::service {

  if $ol8nfs::server::ubuntu::service_manage {
    if $ol8nfs::server::ubuntu::ol8nfs_v4 == true {
      service {'ol8nfs-kernel-server':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['ol8nfs-kernel-server'],
        subscribe  => [ Concat['/etc/exports'], Augeas['/etc/idmapd.conf','/etc/default/ol8nfs-common'] ],
      }
    } else {
      service {'ol8nfs-kernel-server':
        ensure     => running,
        enable     => true,
        hasrestart => true,
        hasstatus  => true,
        require    => Package['ol8nfs-kernel-server'],
        subscribe  => Concat['/etc/exports'],
      }
    }

    Package['rpcbind'] -> Service['rpcbind']
  }
}
