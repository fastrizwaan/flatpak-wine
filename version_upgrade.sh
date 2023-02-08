CURRENT_VERSION=$(grep "tag:" flatpak-wine8/io.github.fastrizwaan.flatpak-wine8.yml |cut -f2 -d ":")

echo "Current Version: ${CURRENT_VERSION}"


if ! [ $# -eq 1 ] ; then
     echo "Give WineZGUI version to update, see VERSION.txt"
     exit
fi
# upgrade tag
echo -n "Update version to $1? "
read a

if [ "$a" = "y" ] || [ "$a" = "Y" ]; then
     echo "Updating tags in all yml files"
     sed "s|tag: .*|tag: ${1}|g" -i */*.yml

     echo "Updating install.sh WineZGUI_Version"
     sed "s|WINEZGUI_VERSION=.*|WINEZGUI_VERSION=${1}|g" -i */install.sh
     sed "s|${CURRENT_VERSION}|${1}|g" -i README.md
else
     echo "Cancelled"
fi
#sed "s|${CURRENT_VERSION}|${2}|g" -i */install.sh */*.yml README.md
