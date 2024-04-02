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


- Configure github with git Following the steps from https://docs.github.com/en/get-started/getting-started-with-git/set-up-git
```bash
git config --global user.name ZabdiAG
git config --global user.email "aguilera.glz.luis@gmail.com

# Create a keypair ssh creds
ssh-keygen -t ed25519 -C "aguilera.glz.luis@gmail.com"
# Rename generated file to ~/.ssh/github
# eval
eval "$(ssh-agent -s)"

# Create ssh config file
mkdir ~/.ssh
cat <<EOF >>~/.ssh/config
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/github
EOF

# add to keychain
ssh-add --apple-use-keychain ~/.ssh/github
```

Copypasta https://docs.github.com/en/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account#about-addition-of-ssh-keys-to-your-account
```bash
pbcopy < ~/.ssh/github.pub
```

Test your GH connection: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection
```bash
ssh -T git@github.com
```
