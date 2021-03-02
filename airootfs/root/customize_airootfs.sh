#!/usr/bin/env bash
#
# SPDX-License-Identifier: GPL-3.0-or-later

set -e -u

# Warning: customize_airootfs.sh is deprecated! Support for it will be removed in a future archiso version.

sed -i 's/#\(en_US\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

# uncomment #Server
sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

# personal home directory
UHOME="/home/seds"

su seds - -c "CI=1 chezmoi -S $UHOME/dotfiles init https://github.com/benmezger/dotfiles.git"
su seds - -c "(cd $UHOME; chezmoi diff)"
su seds - -c "(cd $UHOME; chezmoi apply -v)"
