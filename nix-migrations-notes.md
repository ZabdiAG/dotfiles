# Some steps I'm manually making in my brand-new local setup using MacOSX


- Downloading [alacritty](https://alacritty.org/index.html) terminal and configure files manually:
```bash
vim ~/.config/alacritty/alacritty.toml
```

- Install Nix(from page) - https://nixos.org/download/
```
Multi-user installation
Install Nix via the recommended multi-user installation:

$ sh <(curl -L https://nixos.org/nix/install)
We believe we have ironed out how to cleanly support the read-only root on modern macOS. Please consult the manual on details what the installation script does.
```
- Still figuring out how to install packages from nix-pkg declarative tools, for now, I have:


-  Manually create config files:
```bash
~/.config/nvim/init.vim
~/.tmux.conf
```
