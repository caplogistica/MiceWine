#!/data/data/com.termux/files/usr/bin/bash
case $(uname -m) in "aarch64")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/raw/main/bin/dialog64
	chmod +x dialog64
	;;
	*)
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/raw/main/bin/dialog
	chmod +x dialog
esac

clear

echo -e "[ MiceWine -- Installer ]\n" > $TMPDIR/.dialoginfo

case $(uname -m) in "aarch64")
	./dialog64 English Português///Brasil
	;;
	*)
	./dialog English Português///Brasil
esac

case $(cat $TMPDIR/.dialogout) in "1")
	export CHOICE_VERSION="[ MiceWine -- Installer ]\nChoice a version:"
 	export DOWNLOADING="Downloading"
  	export INSTALLXFCE="[ MiceWine -- Installer ]\nDo you want to install XFCE? (Optional)"
   	export INSTALLDONE="MiceWine Installed Successfully!\nType 'micewine' to start MiceWine.\nHappy Christmas!"
    	export NOYES="No Yes"
 	;;
  	"2")
   	export CHOICE_VERSION="[ MiceWine -- Instalador ]\nEscolha uma versão:"
     	export DOWNLOADING="Baixando"
	export INSTALLXFCE="[ MiceWine -- Instalador ]\nDeseja instalar o XFCE? (Opcional)"
 	export INSTALLDONE="MiceWine foi Instalado com Sucesso!\nDigite 'micewine' para inciar o MiceWine.\nFeliz Natal!"
  	export NOYES="Não Sim"
esac

echo -e "$CHOICE_VERSION" > $TMPDIR/.dialoginfo

case $(uname -m) in "aarch64")
	./dialog64 Alpha///V6.0 Alpha///V5.3 Alpha///V5.2 Alpha///V5.1 Alpha///V5 Alpha///V4///PatchFix///1 Alpha///V4 Alpha///V3 Alpha///V2
	;;
	*)
	./dialog Alpha///V6.0 Alpha///V5.3 Alpha///V5.2 Alpha///V5.1 Alpha///V5 Alpha///V4///PatchFix///1 Alpha///V4 Alpha///V3 Alpha///V2
esac

termux-setup-storage

case $(cat $TMPDIR/.dialogout) in "9")
    	echo "$DOWNLOADING MiceWine Alpha V2..."	
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.2/MiceWine-Alpha-2.zip
    	;;
   	"8")
    	echo "$DOWNLOADING MiceWine Alpha V3..."
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.3/MiceWine-Alpha-V3.zip
    	;;
    	"7")
    	echo "$DOWNLOADING MiceWine Alpha V4..."
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4/MiceWine-Alpha-V4.zip
    	;;
   	 "6")
    	echo "$DOWNLOADING MiceWine Alpha V4 - PatchFix 1..."
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4-patchfix1/MiceWine-Alpha-V4-Fix-1.zip
    	;;
    	"5")
    	echo "$DOWNLOADING MiceWine Alpha V5..."
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5/MiceWine-Alpha-V5.zip
    	;;
   	 "4")
    	echo "$DOWNLOADING MiceWine Alpha V5.1..."
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.1/MiceWine-Alpha-V5.1.zip
    	;;
    	"3")
    	echo "$DOWNLOADING MiceWine Alpha V5.2..."
    	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.2/MiceWine-Alpha-V5.2.zip
    	;;
	"2")
	echo "$DOWNLOADING MiceWine Alpha V5.3..."
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.3/MiceWine-Alpha-V5.3.zip
	;;
	"1")
	echo "$DOWNLOADING MiceWine Alpha V6.0..."
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.6/MiceWine-Alpha-V6.0-Xmas.zip
esac

case $(cat $TMPDIR/.dialogout) in "9")
	unzip -o MiceWine-Alpha-2.zip -d /data/data/com.termux/files/
 	;;
 	"8")
	unzip -o MiceWine-Alpha-V3.zip -d /data/data/com.termux/files/
	;;
	"7")
	unzip -o MiceWine-Alpha-V4.zip -d /data/data/com.termux/files/
	;;
	"6")
	unzip -o MiceWine-Alpha-V4-Fix-1.zip -d /data/data/com.termux/files/
	;;
	"5")
	unzip -o MiceWine-Alpha-V5.zip -d /data/data/com.termux/files/
	;;
	"4")
	unzip -o MiceWine-Alpha-V5.1.zip -d /data/data/com.termux/files/
	;;
	"3")
	unzip -o MiceWine-Alpha-V5.2.zip -d /data/data/com.termux/files/
	;;
	"2")
	unzip -o MiceWine-Alpha-V5.3.zip -d /data/data/com.termux/files/
 	;;
 	"1")
  	unzip -o MiceWine-Alpha-V6.0-Xmas.zip -d /data/data/com.termux/files/
esac

rm -rf *.zip dialog*

echo -e "$INSTALLXFCE" > $TMPDIR/.dialoginfo

micewine-dialog $NOYES

case $(cat $TMPDIR/.dialogout) in "1")
	;;
	"2")
	pkg ins xfce4 firefox -y
esac

echo -e "$INSTALLDONE"

exit
