# Shell for bootstrapping flake-enalbed nix and home-manager
# Enter it through `nix develop` or (legacy) `nix-shell`

{ pkgs ? (import ./nixpkgs.nix) {} }: {
  default = pkgs.mkShell {
    NIX_CONFIG = "experimental-features = nix-command flakes";
    nativeBuildInputs = with pkgs; [ nix home-manager git ];
  };
}
