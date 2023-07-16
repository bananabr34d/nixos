{ config, pkgs, agenix, ... }:

{
  imports = [
     agenix.nixosModules.default
  ];

  environment.systemPackages = [
    agenix.packages."${pkgs.system}".default 
  ];

  age.secrets."smb-creds.file" = {
    file = "./secrets/smb-creds.age";
  };

}
