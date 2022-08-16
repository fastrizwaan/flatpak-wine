#!/bin/bash

sudo flatpak install flathub --system com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable
SRC_DIR=$(dirname $(realpath $0))
echo "SRC_DIR = $SRC_DIR"
cd "/var/lib/flatpak/runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable/active/files"
tar -Jcvf ${SRC_DIR}/proton-ge-6.29.tar.gz .

