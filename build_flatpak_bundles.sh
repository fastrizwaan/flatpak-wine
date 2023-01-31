flatpak remove -y io.github.fastrizwaan.WineZGUI
flatpak remove -y io.github.fastrizwaan.flatpak-proton
flatpak remove -y io.github.fastrizwaan.flatpak-wine5
flatpak remove -y io.github.fastrizwaan.flatpak-wine7
flatpak remove -y io.github.fastrizwaan.flatpak-wine8


time for i in flatpak-*; do 
$i/install.sh bundle; done


