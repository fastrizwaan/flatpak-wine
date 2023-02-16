# Release git

CURRENT_VERSION=$(grep "tag:" flatpak-wine8/io.github.fastrizwaan.flatpak-wine8.yml |cut -f2 -d ":")

DATE=$(date +'%Y%m%d')

cd ~/.build/FLATPAK_BUILD_DIR
#--------------------------------------------------------------------------------------------#
rm *.flatpak
mv $(find . -iname "*${DATE}*.flatpak") .
sha256sum "*${DATE}*.flatpak"|tee sha256sums-${CURRENT_VERSION}_${DATE}.txt
#--------------------------------------------------------------------------------------------#

cd ~/.build/flatpak-wine
#sed 's/'
