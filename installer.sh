#!/usr/bin/env bash

CRE=$(tput setaf 1)
CYE=$(tput setaf 3)
CGR=$(tput setaf 2)
CBL=$(tput setaf 4)
BLD=$(tput bold)
CNC=$(tput sgr0)

backup_folder=~/.RiceBackup
date=$(date +%Y%m%d-%H%M%S)

logo () {
	local text="${1:?}"
	echo -en "                                  
    ▒▒▒▒▒▒▒▒▄▄▄▄▄▄▄▄▒▒▒▒▒▒
    ▒▒█▒▒▒▄██████████▄▒▒▒▒
    ▒█▐▒▒▒████████████▒▒▒▒
    ▒▌▐▒▒██▄▀██████▀▄██▒▒▒
    ▐┼▐▒▒██▄▄▄▄██▄▄▄▄██▒▒▒
    ▐┼▐▒▒██████████████▒▒▒
    ▐▄▐████─▀▐▐▀█─█─▌▐██▄▒
    ▒▒█████──────────▐███▌
    ▒▒█▀▀██▄█─▄───▐─▄███▀▒
    ▒▒█▒▒███████▄██████▒▒▒
    ▒▒▒▒▒██████████████▒▒▒
    ▒▒▒▒▒█████████▐▌██▌▒▒▒
    ▒▒▒▒▒▐▀▐▒▌▀█▀▒▐▒█▒▒▒▒▒
    ▒▒▒▒▒▒▒▒▒▒▒▐▒▒▒▒▌▒▒▒▒▒
   Ghost 1n TH3 SSH Dotfiles\n\n"
    printf ' %s [%s%s %s%s %s]%s\n\n' "${CRE}" "${CNC}" "${CYE}" "${text}" "${CNC}" "${CRE}" "${CNC}"
}

########## ---------- You must not run this as root ---------- ##########
not_sudo () {
    if [ "$(id -u)" = 0 ]; then
        echo "This script MUST NOT be run as root user."
        exit 1
    fi
} 

########## ---------- Welcome ---------- ##########
welcome () {
    logo "Welcome!"
    printf '%s%sThis script will check if you have the necessary dependencies, and if not, it will install them. Then, it will clone the RICE in your HOME directory.\nAfter that, it will create a secure backup of your files, and then copy the new files to your computer.\n\nMy dotfiles DO NOT modify any of your system configurations.\nYou will be prompted for your root password to install missing dependencies and/or to switch to zsh shell if its not your default.\n\nThis script doesnt have the potential power to break your system, it only copies files from my repository to your HOME directory.%s\n\n' "${BLD}" "${CRE}" "${CNC}"

    while true; do
        read -rp " Do you wish to continue? [y/N]: " yn
            case $yn in
                [Yy]* ) break;;
                [Nn]* ) exit;;
                * ) printf " Error: just write 'y' or 'n'\n\n";;
            esac
        done
    clear
}

# ########## ---------- Install packages ---------- ##########
requirements () {
    logo "Installing requirements..."

    packages=(bspwm polybar kitty rofi picom sxhkd lsd feh code firejail neofetch fonts-jetbrains-mono zsh zsh-syntax-highlighting)

    printf "%s%s[+] Checking for required packages...%s\n" "${BLD}" "${CBL}" "${CNC}"
    
    for package in "${packages[@]}"
    do
        if ! apt list --installed "$package" 2>/dev/null | grep -q "$package"; then
            printf '\t- Installing %s...%s\n' "$package"
            sudo apt install "$package" -y &> /dev/null
            
        else
            printf '\t- %s is already installed on your system!\n' "$package"
            sleep 1            
        fi
    done
    printf '%s[+] All requirements successfully met!%s\n' "$CGR" "$CNC"
    sleep 3
    clear
}

########## ---------- Preparing Folders ---------- ##########
prepFolders () {
    logo "Preparing Folders"
    if [ ! -e $HOME/.config/ ]; then
        mkdir $HOME/.config/
        printf "\t- Creating $HOME/.config/..."
    else
        printf "\t- $HOME/.config/ already exists."
    fi
    sleep 2 
    clear
}

########## ---------- Copy the Rice! ---------- ##########
copyRice () {
    logo "Installing dotfiles..."
    printf "%s[+] Copying files to respective directories...\n%s" "$CBL" "$CNC"

    for folder in ./ghost-rice/*; do
        cp -R "${folder}" ~/.config/
        if [ $? -eq 0 ]; then
            printf "\t-%s folder copied succesfully into '${HOME}/.config/'!%s\n" "${folder}" "${CNC}"
            sleep 1
        else
            printf "\t-%s%s failed to been copied, you must copy it manually%s\n" "${CRE}" "${folder}" "${CNC}"
            sleep 1
        fi
    done

    for folder in ./misc/*; do
        cp -R -f "${folder}" ~/.local/share/fonts/
        if [ $? -eq 0 ]; then
            printf "\t-%s copied succesfully into '${HOME}/.local/share/fonts/'!%s\n" "${folder}" "${CNC}"
            sleep 1
        else
            printf "\t-%s%s failed to been copied, you must copy it manually%s\n" "${CRE}" "${folder}" "${CNC}"
            sleep 1
        fi
    done

    fc-cache -rv >/dev/null 2>&1
    printf "%s[+] Files copied succesfully!!%s\n" "${CGR}" "${CNC}"
    sleep 1
}

########## --------- Changing shell to zsh power10k ---------- ##########
chShell () {
    logo "Changing default shell to zsh power10k..."

    # Download powerlevel10k
    if [ ! -d "~/.config/powerlevel10k" ]; then
        git clone --quiet --depth=1 https://gitee.com/romkatv/powerlevel10k.git ~/.config/powerlevel10k
    fi

    # Setup P10K theme and ZSH config
    cp -f home/p10k.zsh ~/.p10k.zsh && cp -f home/zshrc ~/.zshrc

    if [ $? -eq 0 ]; then
        printf "\t-%s files copied succesfully into your home directory!%s\n" "${file}" "${CNC}"
        sleep 1
    else
        printf "\t-%s %s failed to been copied, you must copy it manually%s\n" "${CRE}" "${file}" "${CNC}"
        sleep 1
    fi
    # done

    printf "%s%sIf your shell is not zsh will be changed now.\nYour root password is needed to make the change.\n\nAfter that is important for you to reboot.\n %s\n" "${BLD}" "${CRE}" "${CNC}"
    if [[ $SHELL != "/usr/bin/zsh" ]]; then
        echo "Changing shell to zsh, your root password is needed."
        chsh -s /usr/bin/zsh
        printf "%s%s[+] Installation finished successfully, now reboot the system.\n%sGood bye!\n" "${BLD}" "${CGR}" "${CNC}"
        zsh
    else
        printf "%s%s[+] Installation finished successfully, now reboot the system.\n%sGood bye!\n" "${BLD}" "${CGR}" "${CNC}"
        zsh
    fi
}

########## ---------- Execution ---------- ##########
not_sudo
welcome
requirements
prepFolders
copyRice
chShell