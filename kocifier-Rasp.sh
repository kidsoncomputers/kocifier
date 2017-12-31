#!/usr/bin/env bash

shopt -s extglob
set -o errtrace
set -o errexit

function raspbian_update_packages {
#upgrading kernel without updating grub dependencies
#sudo apt-mark hold grub2-common grub-common

sudo apt-get -y update && sudo apt-get -y upgrade
}


function raspbian_install_software {
  software=( $(curl -sSL https://raw.githubusercontent.com/kidsoncomputers/kocifier/master/ubermix_packages) )

  # change this link to the raspkids_packages

  for package in ${software[*]}
  do
    sudo apt-get -y install $package
  done
}


function remove_keyboard_packages {
  sudo apt-get remove fcitx*
}

function raspbian_kocify {
  raspbian_update_packages
  raspbian_install_software
  # Change the wallpaper using commands
  # Install Kids Ruby
  # Change regional formats
  # Configure input methods
  # remove_keyboard_packages
  # install then remove keyboard packages?
  # locales - Change the timezone to Mexico City
  # Install Language Pack support for Spanish
}

##########################
# Raspbian customization #
##########################

raspbian_kocify

