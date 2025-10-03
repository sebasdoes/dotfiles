# Fedora Surface 

## Install surface kernel

## Post-install mods
```bash 
mkdir -p ~/.local/bin
mkdir -p ~/.local/share/fonts

dnf copr enable atim/starship 
dnf copr enable solopasha/hyprland 

git clone https://github.com/sebasdoes/dotfiles.git
dotfiles/restore_shell.sh 
cp dotfiles/home/.local/bin/* ~/.local/bin/

chsh -s $(which zsh)

curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
tar -xz JetBrainsMono.tar.xz -C ~/.local/share/fonts

sudo yum install -y starship foot kitty hyprland rofi waybar wlogout hyprlock hypridle pypr grimblast swaync pavucontrol pamixer

flatpak install flathub com.bitwarden.desktop
flatpak install flathub md.obsidian.Obsidian

```

