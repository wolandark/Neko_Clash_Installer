#!/bin/bash

#Nekoray/Clash Installer
#Written By: Woland
#https://github.com/wolandark
#Use the BASH shell!

echo -e "\n\033[7;032mNekoray/Clash Install Script for Gnu/Linux\n\033[1;36mWritten By Woland\033[0m"
echo ''

distro=$(grep ^NAME /etc/os-release | awk -F= '{print $2}' | tr -d '"')
array=('Arch Linux' 'Artix Linux' 'EndevourOS' 'Arcolinux')
array2=('Kali GNU/Linux' 'Debian GNU/Linux' 'Ubuntu' 'Linux Mint')

if [[ -f cfw.tar.gz ]] || [[ -f nekoray.zip ]]; then
    echo -e "\033[5;7;1;031mThe Script Has Already Downloaded the Clients\033[0m"
    exit 0
fi

#Check the distribution type & install unzip & wget
for i in "${array[@]}"; do
    if [[ "$distro" = "$i" ]]; then
        # Install the package using pacman
        sudo pacman -S unzip wget --noconfirm
        break
    fi
done

for j in "${array2[@]}"; do
    if [[ "$distro" = "$j" ]]; then
        #Install unzip using apt
        sudo apt installi -y unzip wget
        break
    fi
done

if [[ "$distro" = "Fedora Linux" ]]; then
    sudo dnf install unzip wget
    fi

PS3='Please enter your choice: '
options=("Nekoray" "Clash" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Nekoray")
            echo -e "\033[7;32mYou selected Nekoray\033[0m"
            wget https://github.com/MatsuriDayo/nekoray/releases/download/2.14/nekoray-2.14-2023-02-04-linux64.zip -O nekoray.zip
            unzip nekoray.zip
            break
            ;;
        "Clash")
            echo -e "\033[7;32mYou selected Clash\033[0m"
            wget https://github.com/Fndroid/clash_for_windows_pkg/releases/download/0.20.16/Clash.for.Windows-0.20.16-x64-linux.tar.gz -O cfw.tar.gz 
            mkdir clash && tar -xzvf cfw.tar.gz -C clash --strip-components=1
            break
            ;;
        "Quit")
            echo -e "\033[5;7;1;031mExiting The Script\033[0m"
            exit 0
            ;;
        *) echo -e "\033[5;7;1;031mInvalid option\033[0m";;
    esac
done

if [[ -d nekoray ]]; then
    cd nekoray || return
    sudo ./launcher
    echo "Nekoray Launched"
fi

if [[ -d clash ]]; then
    cd clash || return
    ./cfw &
    echo "Clash Launched"
fi

echo -e "\033[7;032mThe Script is done! You can now launch your client. For nekoray cd into its directory and execute sudo ./launcher from terminal. For Clash use ./cfw to launch the client.\033[0m"
echo ''
echo -e "\033[7;034mEnjoy Your Freedom\033[0m"
echo ''
echo -e "\033[7;1;33mI recommend getting your free servers from this repository\n\033[4;32mhttps://github.com/mahdibland/V2RayAggregator\033[0m"
echo ''
echo -e "\033[7;034mFor More Scripts and Goodies Visit My GitHub\033[0m"
echo -e "\033[4;32mhttps://github.com/wolandark\033[0m"
