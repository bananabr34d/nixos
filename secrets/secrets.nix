let
  joe = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIINYvgRaMBzpjuK0+w5OQAQTkcoiOKFqBAQANKMfKlV5 joe@nixos";
  users = [ joe ];

  nixos = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBVL0NJIpTD1VuEhLBAbQHK4he5MOM4tUGRjTccvIEXd root@nixos";
  systems = [ nixos ];
in
{
 "secret1.age".publicKeys = [ joe nixos ];
 "smb-creds.age".publicKeys = users ++ systems;
 ###  "./encrypt/smb-creds.age".publicKeys = users ++ systems;
}
