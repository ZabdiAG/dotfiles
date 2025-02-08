# shell.nix
let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-24.11";

  pkgs = import nixpkgs { config = {}; overlays = []; };
in pkgs.mkShellNoCC {
  packages = with pkgs; [
    # std cli tools
    cowsay
    lolcat
    neovim
    ripgrep
    jq
    wget
    tree
    tree-sitter
    git
    tmux
    fzf

    # Golang
    go
    gopls

    # Rust
    cargo
    rustc
    rust-analyzer

    # Ruby
    ruby_3_3

    lua
    google-cloud-sdk

    # All k8s related
    kubectl
    kubernetes-helm

    # Containers
    lima
    podman

    docker-client

    (pkgs.python3.withPackages (python-pkgs: [
      # select Python packages here
      #python-pkgs.pandas
      #python-pkgs.requests
    ]))
  ];
}
