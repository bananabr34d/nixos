let
  joe = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIFVnMR63Dd4G3/eWhzyqg23gE4a23Diibw1ivk8DveY8 joe@oxygen";
  users = [ joe ];

  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVL0NJIpTD1VuEhLBAbQHK4he5MOM4tUGRjTccvIEXd root@nixos";
  oxygen = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIODNfrKtBQ9ZISYGKsd6ll7uLMQuz4u9vaWCDds6PiAp root@oxygen";
  systems = [ nixos oxygen ];

in {
 # "secret1.age".publicKeys = [ joe nixos ];
 # "smb-creds.age".publicKeys = [ joe nixos ];
 "smb-creds.age".publicKeys = users ++ systems;
}
