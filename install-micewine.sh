#!/data/data/com.termux/files/usr/bin/bash
case $(uname -m) in "aarch64")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/raw/main/bin/dialog64
	chmod +x dialog64
	;;
	*)
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/raw/main/bin/dialog
	chmod +x dialog64
esac

clear

echo -e "[ MiceWine -- Instalador ]\n" > $TMPDIR/.dialoginfo

echo -e "Escolha uma versão:" >> $TMPDIR/.dialoginfo

case $(uname -m) in "aarch64")
	./dialog64 Alpha///V5.3 Alpha///V5.2 Alpha///V5.1 Alpha///V5 Alpha///V4///PatchFix///1 Alpha///V4 Alpha///V3 Alpha///V2
	;;
	*)
	./dialog Alpha///V5.3 Alpha///V5.2 Alpha///V5.1 Alpha///V5 Alpha///V4///PatchFix///1 Alpha///V4 Alpha///V3 Alpha///V2
esac

termux-setup-storage

case $(cat $TMPDIR/.dialogout) in "8")
	echo "Baixando o MiceWine Alpha V2..."
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.2/MiceWine-Alpha-2.zip
 	;;
  	"7")
	echo "Baixando o MiceWine Alpha V3..."
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.3/MiceWine-Alpha-V3.zip
 	;;
  	"6")
	echo "Baixando o MiceWine Alpha V4..."
   	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4/MiceWine-Alpha-V4.zip
    ;;
    "5")
	echo "Baixando o MiceWine Alpha V4 - PatchFix 1..."
    curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4-patchfix1/MiceWine-Alpha-V4-Fix-1.zip
    ;;
    "4")
	echo "Baixando o MiceWine Alpha V5..."
    curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5/MiceWine-Alpha-V5.zip
    ;;
    "3")
	echo "Baixando o MiceWine Alpha V5.1..."
    curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.1/MiceWine-Alpha-V5.1.zip
   	;;
   	"2")
	echo "Baixando o MiceWine Alpha V5.2..."
    curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.2/MiceWine-Alpha-V5.2.zip
    ;;
    "1")
    echo "Baixando o MiceWine Alpha V5.3..."
    curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.3/MiceWine-Alpha-V5.3.zip
esac

case $(cat $TMPDIR/.dialogout) in "8")
	unzip -o MiceWine-Alpha-2.zip -d /data/data/com.termux/files/
 	;;
 	"7")
	unzip -o MiceWine-Alpha-V3.zip -d /data/data/com.termux/files/
	;;
	"6")
	unzip -o MiceWine-Alpha-V4.zip -d /data/data/com.termux/files/
	;;
	"5")
	unzip -o MiceWine-Alpha-V4-Fix-1.zip -d /data/data/com.termux/files/
	;;
	"4")
	unzip -o MiceWine-Alpha-V5.zip -d /data/data/com.termux/files/
	;;
	"3")
	unzip -o MiceWine-Alpha-V5.1.zip -d /data/data/com.termux/files/
	;;
	"2")
	unzip -o MiceWine-Alpha-V5.2.zip -d /data/data/com.termux/files/
	;;
	"1")
	unzip -o MiceWine-Alpha-V5.3.zip -d /data/data/com.termux/files/
esac

rm -rf *.zip dialog*

echo -e "[ MiceWine -- Instalador ]\n" > $TMPDIR/.dialoginfo

echo -e "Deseja instalar a interface XFCE? (Opcional)\n" >> $TMPDIR/.dialoginfo

dialog Não Sim

case $(cat $TMPDIR/.dialogout)in "1")
	;;
	"2")
	pkg ins xfce4 firefox -y
esac

echo -e "MiceWine Alpha V$ver $SUFFIX - Instalado!\n"
echo -e "Digite 'micewine' para começar a usar!"

source $PREFIX/etc/termux-login.sh

exit
