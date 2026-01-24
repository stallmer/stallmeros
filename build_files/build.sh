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
	kitty \
	neovim \
	tailscale \
	fontawesome-fonts-all \
	brightnessctl \
	gnome-tweaks \
	nextcloud-client

# Use a COPR Example:
#
# dnf5 -y copr enable ublue-os/staging
# dnf5 -y install package
# Disable COPRs so they don't end up enabled on the final image:
# dnf5 -y copr disable ublue-os/staging
#dnf5 -y copr enable lionheartp/Hyprland
#dnf5 install -y \
#	hyprland \
#	hyprpaper \
#	hyprlock \
#	hypridle \
#	hyprutils \
#	hyprpicker \
#	hyprshot \
#	hyprsunset \
#	hyprtoolkit \
#	uwsm \
#	hyprland-plugins \
#	hyprland-guiutils \
#	hyprland-qt-support \
#	hyprpolkitagent \
#	xdg-desktop-portal-hyprland \
#	aquamarine \
#	hyprcursor
#dnf5 -y copr disable lionheartp/Hyprland

dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 install -y \
	cosmic-desktop
dnf5 -y copr disable ryanabx/cosmic-epoch

# Install faugus-launcher games launcher
dnf5 -y copr enable faugus/faugus-launcher
dnf5 install -y \
	faugus-launcher
dnf5 -y copr disable faugus/faugus-launcher
#### Example for enabling a System Unit File

systemctl enable podman.socket
