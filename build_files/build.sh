#!/bin/bash

set -ouex pipefail

### Install packages

# Packages can be installed from any enabled yum repo on the image.
# RPMfusion repos are available by default in ublue main images
# List of rpmfusion packages can be found here:
# https://mirrors.rpmfusion.org/mirrorlist?path=free/fedora/updates/39/x86_64/repoview/index.html&protocol=https&redirect=1

# this installs a package from fedora repos
dnf5 install -y \
	tmux \
	rclone \
	zsh \
	pavucontrol \
	kitty \
	neovim \
	waybar \
	tailscale \
	wofi \
	blueman \
	network-manager-applet \
	fontawesome-fonts-all \
	brightnessctl

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
dnf5 -y copr enable lionheartp/Hyprland
dnf5 install -y \
	hyprland \
	hyprpaper \
	hyprlock \
	hyprutils \
	hyprtoolkit \
	uwsm \
	hyprland-plugins \
	hyprland-qt-support \
	hyprpolkitagent \
	aquamarine \
	hyprcursor
dnf5 -y copr disable lionheartp/Hyprland
#### Example for enabling a System Unit File

systemctl enable podman.socket
