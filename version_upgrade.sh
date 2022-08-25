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
else
     echo "Cancelled"
fi
#sed "s|${1}|${2}|g" -i */install.sh */*.yml README.md
