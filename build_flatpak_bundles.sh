#flatpak remove -y io.github.fastrizwaan.WineZGUI
#flatpak remove -y io.github.fastrizwaan.flatpak-proton
#flatpak remove -y io.github.fastrizwaan.flatpak-wine5
#flatpak remove -y io.github.fastrizwaan.flatpak-wine7
#flatpak remove -y io.github.fastrizwaan.flatpak-wine8
SOURCEDIR=~/.build/flatpak-wine
OLD_VERSION=$(git tag|tail -1)
#BUILD="flatpak-winezgui flatpak-wine8 flatpak-wine7 flatpak-proton flatpak-wine5"
BUILD="flatpak-winezgui"
REMOVE_ME=$(echo ${BUILD}|sed "s/flatpak-winezgui/WineZGUI/g")

flatpak remove -y io.github.fastrizwaan.${REMOVE_ME}
 
time for i in $BUILD; 
do
  bash ${SOURCEDIR}/$i/install.sh bundle; 
done

### Make Flatpak Release
# Release git
FLATPAK_BUILD_DIR=~/.build/FLATPAK_BUILD_DIR

cd ${FLATPAK_BUILD_DIR}

CURRENT_VERSION=$(grep "tag:" ${FLATPAK_BUILD_DIR}/flatpak-winezgui/io.github.fastrizwaan.WineZGUI.yml |cut -f2 -d ":")

DATE=$(date +'%Y%m%d')
CURRENT_VERSION_DATE=$(echo ${CURRENT_VERSION}_${DATE})
echo "SOURCEDIR=$SOURCEDIR"
echo "OLD_VERSION=$OLD_VERSION"
echo "FLATPAK_BUILD_DIR=$FLATPAK_BUILD_DIR"
echo "CURRENT_VERSION = $CURRENT_VERSION"
echo "DATE=$DATE"
echo "CURRENT_VERSION_DATE=${CURRENT_VERSION}_${DATE}"


#--------------------------------------------------------------------------------------------#
rm -v *.flatpak
mv $(find ~/.build/FLATPAK_BUILD_DIR/ -ctime -1 -iname "*.flatpak") $FLATPAK_BUILD_DIR
sha256sum *.flatpak|tee sha256sums-${CURRENT_VERSION_DATE}.txt
#--------------------------------------------------------------------------------------------#

cd ~/.build/flatpak-wine
# Update version in README.md
sed "s/${OLD_VERSION}_[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]/${CURRENT_VERSION}_${DATE}/g" -i README.md
sed "s/${OLD_VERSION}/${CURRENT_VERSION}/g" -i README.md

