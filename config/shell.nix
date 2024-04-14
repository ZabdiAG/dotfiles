# shell.nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";

  pkgs = import nixpkgs { config = {}; overlays = []; };
in pkgs.mkShellNoCC {
  packages = with pkgs; [
    cowsay
    lolcat
    neovim
    ripgrep
    git
    tmux
    fzf
    go
    gopls


    cargo
    rustc
    rust-analyzer


    lua
    google-cloud-sdk

    lima
    podman

    (pkgs.python3.withPackages (python-pkgs: [
      # select Python packages here
      #python-pkgs.pandas
      #python-pkgs.requests
    ]))
  ];
}
