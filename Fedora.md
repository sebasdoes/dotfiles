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
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/GeistMono.tar.xz
tar -xz JetBrainsMono.tar.xz -C ~/.local/share/fonts
tar -xz GeistMono.tar.xz -C ~/.local/share/fonts

sudo yum install -y starship foot kitty hyprland rofi waybar wlogout hyprlock hypridle pypr grimblast swaync pavucontrol pamixer kanshi

flatpak install flathub com.bitwarden.desktop
flatpak install flathub md.obsidian.Obsidian
flatpak install flathub com.bambulab.BambuStudio
flatpak install flathub com.spotify.Client

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

```

## Hibernate

This does not work with secure boot

```shell
# Create swap on btrfs
sudo btrfs filesystem mkswapfile --size 16G /swapfile

# Find offset
sudo btrfs inspect-internal map-swapfile -r /swapfile

# Edit fstab
[...]
/swapfile none swap defaults 0 0

# Edit /etc/default/grub
[...]
GRUB_CMDLINE_LINUX="rhgb quiet resume=UUID=a1044756-8897-4c6b-acf3-fe2686ccaa1b resume_offset=3819479"
[...]

# Regenerate grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg

# Regenerate dracut
sudo dracut --regenerate-all --force
```

This works in theory, but resume does not work because `/boot/efi` and `/boot` are mounted before hibernating

`/etc/systemd/system/root-resume.service`:
```
[Unit]
Description=Local system resume actions
After=suspend.target hibernate.target

[Service]
Type=simple
ExecStart=mount /boot
ExecStart=mount /boot/efi

[Install]
WantedBy=suspend.target hibernate.target
```

`/etc/systemd/system/root-suspend.service`:
```
[Unit]
Description=Local system suspend actions
Before=sleep.target

[Service]
Type=simple
ExecStart=umount /boot/efi
ExecStart=umount /boot

[Install]
WantedBy=sleep.target
```

`/usr/lib/systemd/logind.conf`:
```
[...]
HandleLidSwitch=sleep
[...]
```


`~/.config/systemd/user/kanshi.service`:
```
[Unit]
Description=Kanshi display manager
After=graphical-session.target

[Service]
ExecStart=/usr/bin/kanshi
Restart=always
RestartSec=5
Environment=DISPLAY=:0
Environment=XDG_RUNTIME_DIR=/run/user/%U

[Install]
WantedBy=default.target
```
