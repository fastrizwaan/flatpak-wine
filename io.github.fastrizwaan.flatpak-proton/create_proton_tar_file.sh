#!/bin/bash

sudo flatpak install flathub --system com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable
SRC_DIR=$(dirname $(realpath $0))
echo "SRC_DIR = $SRC_DIR"
cd "/var/lib/flatpak/runtime/com.valvesoftware.Steam.CompatibilityTool.Proton-GE/x86_64/stable/active/files"
tar -zcvf ${SRC_DIR}/proton-ge-7.29.tar.gz .

