Using Ubuntu 19.04 installer:
===

Boot into the USB stick
Go through the installation GUI

Minimal installation
Install 3rd party

Erase disk and install ubuntu,
Encrypt the disk
Don't bother overwriting the entire disk if it's new

On XPS 15, graphics don't work out of the box
---

* reboot in recovery mode (F2 >> Advanced options >> recovery)
* Enable Networking
* root terminal
```
# vi /etc/default/grub
```
Add:
    "quiet splash acpi_rev_override=1 acpi_osi=Linux nouveau.modeset=0 pcie_aspm=force drm.vblankoffdelay=1 scsi_mod.use_blk_mq=1 nouveau.runpm=0 mem_sleep_default=deep "
to the line:
    GRUB_CMDLINE_LINUX_DEFAULT"
```
reboot
```

Install software
---

sudo apt update
sudo apt upgrade
sudo apt install cmake curl neovim git zsh gnome-tweaks fzf arc-theme zsh-theme-powerlevel9k zsh-syntax-highlighting zsh-autosuggestions libssl-dev

Firefox sync
---
Open firefox
Connect to firefox-sync

Setup ssh
---
```
ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub
```
Add it to github (from their gui: settings >> SSH & GPG keys)

Install nerdfont hack
---
Follow instructions from
Download https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/Hack.zip
unzip Hack.zip
sudo mkdir /usr/local/share/fonts/hack/
sudo mv Hack\ * /usr/local/share/fonts/hack/
fc-cache -f -v

Tweaks
---
Start gnome-tweaks
### General
Toggle "Suspend when laptop lid is close" to off
### Appearance
Themes
  Applications >> Arc-Dark
### Extensions
Click the cog next to Desktop icons
Toggle both "Show the ..." off
### Fonts
Interface Text >> "Hack Nerd Font Regular" 11
Document Text >> "Hack Nerd Font Regular" 11
Monospace Text >> "Hack Nerd Font Mono Regular" 13
Legacy Windows titles >> "Hack Nerd Font Bold" 11
Hinting >> Full
### Keyboard & Mouse
Mouse click emulation >> Area
### Windows
Windows focus >> Focus on hover

Settings
---
### Mouse & Touchpad
Natural Scrolling >> Off
### Dock
Auto-hide the Dock >> On

Terminal settings
---
Open terminal (ctrl+alt+T)
right click >> Show menubar
Edit >> preferences
Profiles
Colours >> Built-in schemes: Solarized dark
Command: /usr/bin/zsh

CLI environment
---
Install plug:
```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

```
cd ~/Documents
mkdir code
cd code
git clone git@github.com:pierrechevalier83/dotfiles
cp dotfiles/ubuntu/zshrc ~/.zshrc
mkdir ~/.config/nvim
cp dotfiles/ubuntu/init.vim ~/.config/nvim/
```

`vim ~/.config/nvmi/init.vim`
:PlugInstall
:UpdateRemotePlugins

Install rust
---
```
curl https://sh.rustup.rs -sSf | sh
rustup component add clippy rustfmt
cargo install exa cargo-watch add-remote

