# Release git
FLATPAK_BUILD_DIR="~/.build/FLATPAK_BUILD_DIR"

cd ${FLATPAK_BUILD_DIR}

CURRENT_VERSION=$(grep "tag:" ${FLATPAK_BUILD_DIR}/flatpak-wine8/io.github.fastrizwaan.flatpak-wine8.yml |cut -f2 -d ":")

DATE=$(date +'%Y%m%d')


#--------------------------------------------------------------------------------------------#
rm -v *.flatpak
mv $(find ~/.build/FLATPAK_BUILD_DIR/ -ctime -1 -iname "*.flatpak") .
sha256sum *${DATE}*.flatpak|tee sha256sums-${CURRENT_VERSION}_${DATE}.txt
#--------------------------------------------------------------------------------------------#

cd ~/.build/flatpak-wine
# Update version in README.md
sed "s/${OLD_VERSION}_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/${CURRENT_VERSION}
