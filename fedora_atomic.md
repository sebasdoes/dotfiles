curl -OL "https://copr.fedorainfracloud.org/coprs/solopasha/hyprland/repo/fedora-41/solopasha-hyprland-fedora.repo"
curl -OL "https://copr.fedorainfracloud.org/coprs/atim/starship/repo/fedora-41/atim-starship-fedora.repo"
rpm-ostree refresh-md
rpm-ostree install zsh eza bat starship hyprlock hyprland kitty pyprland hyprpolkitagent hyprsunset hyprpaper hypridle hyprlock xdg-desktop-portal-hyprland openssh-askpass vim 

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install flathub com.bitwarden.desktop
flatpak install flathub md.obsidian.Obsidian

trust anchor root.crt

toolbox create
toolbox run sudo dnf install -y kitty-terminfo
toolbox run sudo dnf copr enable atim/starship 
toolbox run sudo dnf install -y starship

chsh -s $(which zsh)

## Bitwarden CLI & VS Code
# npm install -g @bitwarden/cli
# sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
# dnf check-update
# sudo dnf install code
