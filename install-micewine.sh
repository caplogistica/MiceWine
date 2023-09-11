#!/data/data/com.termux/files/usr/bin/sh
while :; do
clear
echo -e "[ MiceWine -- Alpha ]\n"

echo -e "Escolha uma versão:\n 1) Alpha V2\n 2) Alpha V3\n 3) Alpha V4 -- PatchFix 1"

read ver

case $ver in "3")
	SUFFIX="PatchFix 1"
esac

echo -e "Você realmente deseja instalar o MiceWine Alpha V$(($ver+1)) $SUFFIX? (S/N)\n:"
read install

case $install in "S"|"s")
	break
	;;
	"N"|"n")
  	exit 1
	;;
	*)
esac
done

termux-setup-storage

echo "Baixando o MiceWine Alpha V$(($ver+1)) $SUFFIX..."

case $ver in "1")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.2/MiceWine-Alpha-2.zip
 	;;
  	"2")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.3/MiceWine-Alpha-V3.zip
 	;;
  	"3")
   	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4-patchfix1/MiceWine-Alpha-V4-Fix-1.zip
esac

echo "Extraindo..."
case $ver in "1")
	unzip -o MiceWine-Alpha-2.zip -d /data/data/com.termux/files/
 	;;
  	"2")
	unzip -o MiceWine-Alpha-V3.zip -d /data/data/com.termux/files/
 	;;
  	"3")
   	unzip -o MiceWine-Alpha-V4-Fix-1.zip -d /data/data/com.termux/files/
esac

rm -rf MiceWine-Alpha-V3.zip MiceWine-Alpha-2.zip MiceWine-Alpha-V4-Fix-1.zip

while :; do
echo -e "Deseja instalar a interface XFCE? (S/N) (Opcional)\n"
read xfce

case $xfce in "S"|"s")
	pkg ins xfce4 firefox -y
 	break
  	;;
   	"N"|"n")
    	break
esac
done

echo -e "MiceWine Alpha V$(($ver+1)) $SUFFIX - Instalado!\n"
echo "Digite: "exit" e logo após"
echo "Digite: "micewine" para começar usar!"

exit
