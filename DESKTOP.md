# Fedora Post-install

```bash 
dnf install -y zsh git neovim npm unzip tar gnome-themes-extra sddm-wayland-sway eza bat firefox firefox-wayland iwlwifi-mvm-firmware iwlwifi-dvm-firmware fcitx5 nautilus samba-client cifs-utils

dnf copr enable atim/starship 
dnf install -y starship

dnf copr enable solopasha/hyprland 
dnf install -y hyprlock hyprland kitty

git clone https://github.com/sebasdoes/dotfiles.git
dotfiles/restore_shell.sh 
cp dotfiles/home/.local/bin/* ~/.local/bin/

chsh -s $(which zsh)

systemctl enable sddm
systemctl set-default graphical.target

npm install -g @bitwarden/cli

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update
sudo dnf install code

## Font
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.tar.xz
mkdir -p ~/.local/share/fonts
tar -xf Hack.tar.xz -C ~/.local/share/fonts
fc-cache -f -v
rm Hack.tar.xz
```

# Hyprland customization
```
### https://github.com/end-4/dots-hyprland/tree/main?tab=readme-ov-file

## Dependencies 
# Basic
dnf install -y coreutils cliphist cmake fuzzel rsync wget ripgrep gojq npm meson typescript gjs axel
npm install -g sass

# MicroTeX
dnf install -y tinyxml2 gtkmm3.0 gtksourceviewmm cairomm

# Python
dnf install -y python-pip python-build python-pillow python-setuptools_scm python-wheel
pip3 install --user pywal materialyoucolor # materialyoucolor-git

# Basic Graphic Env
dnf install -y xrandr xdg-desktop-portal xdg-desktop-portal-hyprland xdg-desktop-portal-gtk

# Player and Audio
dnf install -y pavucontrol wireplumber libdbusmenu-gtk3 playerctl swww

# GTK
dnf install -y webp-pixbuf-loader gtk-layer-shell gtk3 gtksourceview3 gobject-introspection upower yad ydotool

# Gnome 
dnf install -y polkit-gnome gnome-keyring gnome-control-center NetworkManager brightnessctl wlsunset gnome-bluetooth3.34

# Widgets
dnf install -y python-pywayland python-psutil hypridle hyprlock wlogout wl-clipboard hyprpicker

# Fonts & Themes
dnf copr enable lyessaadi/gradience
dnf copr enable atim/starship 
dnf install gradience adw-gtk3-theme qt5ct qt5-qtwayland fontconfig starship foot fish material-icons-6onts 
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz
curl -OL https://github.com/ryanoasis/nerd-fonts/releases/latest/download/SpaceMono.tar.xz

tar -xf JetBrainsMono.tar.xz -C ~/.local/share/fonts
tar -xf SpaceMono.tar.xz -C ~/.local/share/fonts
rm *.tar.xz

curl -OL https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsOutlined%5BFILL,GRAD,opsz,wght%5D.ttf
curl -OL https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsRounded%5BFILL,GRAD,opsz,wght%5D.ttf
curl -OL https://github.com/google/material-design-icons/raw/master/variablefont/MaterialSymbolsSharp%5BFILL,GRAD,opsz,wght%5D.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/variable/Readexpro%5BHEXP,wght%5D.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/ttf/ReadexPro-ExtraLight.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/ttf/ReadexPro-Light.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/ttf/ReadexPro-Medium.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/ttf/ReadexPro-Regular.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/ttf/ReadexPro-SemiBold.ttf
curl -OL https://github.com/ThomasJockin/readexpro/raw/master/fonts/ttf/ReadexPro-Bold.ttf
mv *.ttf ~/.local/share/fonts/

fc-cache -f -v

# Screenshot and recorder
dnf install -y swappy wf-recorder grim tesseract tesseract slurp

## ANYRUN
dnf install -y gtk-layer-shell-devel pango-devel gtk3-devel cairo-devel gdk-pixbuf2-devel glib2-devel rustup rustc cargo
git clone https://github.com/Kirottu/anyrun.git 
cd anyrun
cargo build --release 
cargo install --path anyrun/
mkdir -p ~/.config/anyrun/plugins
cp target/release/*.so ~/.config/anyrun/plugins


## BLUEBERRY
# Not going to happen

## TESSERACT-DATA-ENG
# OCR, for later

# After that 
dnf install -y glib2-devel gobject-introspection-devel gjs-devel gtk3-devel pulseaudio-libs-devel pam-devel tinyxml2-devel gtkmm3.0-devel gtksourceviewmm3-devel 

# Currently AGS does not compile on Fedora, you need to checkout 915c3df
./non-Arch-installer.temp.sh

```

## Post-install:
1. Disable natural scrolling
2. Disable touch to click
3. Replace foot with kitty
