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
flatpak install flathub com.bambulab.BambuStudio
flatpak install flathub com.spotify.Client

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

```

