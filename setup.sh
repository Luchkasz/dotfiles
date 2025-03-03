#!/bin/bash

if ! command -v git &> /dev/null; then
    sudo pacman -Sy git --noconfirm
fi

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

aur_apps=("visual-studio-code-bin" "zen-browser-bin" "brave-bin" "discord" "spotify" "mongodb-bin" "postman-bin" "jdk8-openjdk" "kitty" "rofi" "zsh" "picom" "thunar" "unzip" "unrar" "thunar-archive-plugin" "betterlockscreen" "lxappearance" "studio-3t" "gradle" "xarchiver" "arandr" "nitrogen" "mousepad" "stremio-beta" "ttf-fira-code" "ttf-firacode")

for app in "${aur_apps[@]}"; do
    yay -S --noconfirm "$app"
done

sudo systemctl start mongodb
sudo systemctl enable mongodb

git config --global user.name "Lucas Gomes da Silva"
git config --global user.email "silva.lucasgomes@protonmail.com"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo pacman -S xdg-user-dirs --noconfirm
xdg-user-dirs-update

#sudo pacman -S nvidia nvidia-settings nvidia-utils --noconfirm
