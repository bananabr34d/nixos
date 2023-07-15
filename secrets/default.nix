{ config, pkgs, agenix, ... }:

{
  imports = [
     agenix.nixosModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default 
  ];

  age.secrets.secret1.file = ../../secret/secret1.age

  # smb-credentials 
###  age.secrets."smb-creds" = {
#    # whether secrets are symlinked to age.secrets.<name>.path
#    symlink = true;
#    # target path for decrypted file
#    path = /home/joe/
#    # encrypted file path
#    file = ./encrypt/smb-creds.age;
  };
}
