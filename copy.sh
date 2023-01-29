mkdir -p home/.config
mkdir -p home/.vim

cp -R ~/.config/hypr home/.config/
cp -R ~/.config/systemd home/.config/
cp -R ~/.config/terminator home/.config/
cp -R ~/.config/rofi home/.config/
cp -R ~/.config/waybar home/.config/
cp -R ~/.config/wireplumber home/.config/
cp -R ~/.config/pipewire home/.config/
cp -R ~/.config/nvim home/.config/
cp -R ~/.config/neofetch home/.config/
cp -R ~/.config/alacritty home/.config/
cp -R ~/.config/dunst home/.config/
cp -R ~/.config/fcitx5 home/.config/

cp -R ~/.vim/colors home/.vim/

## Files
cp ~/.vimrc home/.vimrc
cp ~/.zshrc home/.zshrc
cp ~/.zimrc home/.zimrc

cp ~/.config/chrome-flags.conf home/.config/chrome-flags.conf
