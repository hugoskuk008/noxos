{
boot.supportedFilesystems = [ "nfs" ];
  fileSystems."/mnt/Media" = {
    device = "192.168.10.10:/mnt/nas-array/subvol-100-disk-0";
    fsType = "nfs4";
  };


}
