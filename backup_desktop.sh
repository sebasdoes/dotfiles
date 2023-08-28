mkdir -p home/.config

# Folders
cp -R ~/.config/hypr home/.config/
cp -R ~/.config/systemd home/.config/
cp -R ~/.config/rofi home/.config/
cp -R ~/.config/waybar home/.config/
cp -R ~/.config/wireplumber home/.config/
cp -R ~/.config/pipewire home/.config/
cp -R ~/.config/neofetch home/.config/
cp -R ~/.config/dunst home/.config/
cp -R ~/.config/fcitx5 home/.config/

# Files
cp ~/.config/chrome-flags.conf home/.config/chrome-flags.conf
