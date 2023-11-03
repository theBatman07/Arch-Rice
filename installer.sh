#!/bin/bash

# Clone yay-bin and install it
git clone https://aur.archlinux.org/yay-bin
cd yay-bin
makepkg -si
cd ..

# Install desired packages using yay
yay -S --needed awesome-git polybar picom-pijulius-git alacritty betterlockscreen catppuccin-gtk-theme-mocha conky logo-ls lxappearance neovim neofetch papirus-icon-theme feh rofi xidlehook sddm qt5-graphicaleffects qt5-quickcontrols2 qt5-svg

# Clone the awesome-setup repository
git clone https://github.com/MeledoJames/awesome-setup.git

# Backup .config folder
if [ -d ~/.config ]; then
    mv ~/.config ~/.config_backup
fi

# Copy configuration files and fonts from awesome-setup
cp -r ~/awesome-setup/config/* ~/.config
cp -r ~/awesome-setup/fonts/* ~/.local/share/fonts
fc-cache -v -f
sudo cp -r ~/.config/sddm/sugar-candy /usr/share/sddm/themes/
sudo cp -r ~/.config/sddm/sddm.conf /etc/

# Enable betterlockscreen
systemctl enable betterlockscreen@$USER

# Copy additional files from awesome-setup
cp -r ~/awesome-setup/cmatrix.sh ~/awesome-setup/grubupdate.sh ~/awesome-setup/.xinitrc ~/awesome-setup/.Xresources ~/awesome-setup/.zprofile ~/awesome-setup/.zshrc ~/

echo "Installation and setup completed."
