#!/bin/bash

if ! command -v git &> /dev/null; then
    sudo pacman -Sy git --noconfirm
fi

git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay

aur_apps=("rofi" "zsh" "xarchiver" "waterfox-bin" "visual-studio-code-bin" "vim" "unrar" "unzip" "thunar" "thunar-archive-plugin" "studio-3t" "spotify" "postman-bin" "pavucontrol" "mongodb-bin" "mongodb-tools-bin" "lxappearance" "jdk8-openjdk" "kitty" "discord" "arandr" "nitrogen" "gradle")

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

