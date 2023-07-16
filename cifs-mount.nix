{ config, pkgs, ... }:

{
  # mount a smb/cifs share
  fileSystems."/home/joe/NAS" = {
    device = "//10.235.10.200/data";
    fsType = "cifs";
    options = [
      "vers=3.0,uid=1000,gid=1000,dir_mode=0755,file_mode=0755,mfsymlinks,credentials=${config.age.secrets.smb-creds.path},nofail"
    ];
  }:
}
