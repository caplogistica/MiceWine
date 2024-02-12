#!/data/data/com.termux/files/usr/bin/bash
case $(uname -m) in "aarch64")
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/raw/main/bin/dialog64
	chmod +x dialog64
	export OS_ARCH=arm64
	;;
	*)
	curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/raw/main/bin/dialog
	chmod +x dialog
	export OS_ARCH=arm32
esac

clear

echo -e "[ MiceWine -- Installer ]\n" > $TMPDIR/.dialoginfo

case $OS_ARCH in "arm64")
	./dialog64 English Português///Brasil
	;;
	*)
	./dialog English Português///Brasil
esac

case $(cat $TMPDIR/.dialogout) in "1")
	export CHOICE_VERSION="[ MiceWine -- Installer ]\nChoice a version:\n"
 	export DOWNLOADING="Downloading"
   	export INSTALLDONE="MiceWine Installed Successfully!\nType 'micewine' to start MiceWine.\nHappy New Year!"
	export NOYES="No Yes"
	export CHECKINGSHA512SUM="Checking SHA512SUM..."
	export SHA512SUM_FAILED="SHA512SUM failed. Please restart the installation."
	export INSTALL_32OR64_VERSION="[ MiceWine -- Installer ]\nDo you want to install 32bits version or 64bits version?\n"
 	;;
  	"2")
   	export CHOICE_VERSION="[ MiceWine -- Instalador ]\nEscolha uma versão:\n"
	export DOWNLOADING="Baixando"
 	export INSTALLDONE="MiceWine foi Instalado com Sucesso!\nDigite 'micewine' para inciar o MiceWine.\nFeliz Ano Novo!"
  	export NOYES="Não Sim"
	export CHECKINGSHA512SUM="Checando SHA512SUM..."
	export SHA512SUM_FAILED="SHA512SUM falhou. Por favor tente de novo."
	export INSTALL_32OR64_VERSION="[ MiceWine -- Instalador ]\nVocê quer instalar a versão 32bits ou 64bits?\n"
esac

case $OS_ARCH in "arm64")
	echo -e "$INSTALL_32OR64_VERSION" > "$TMPDIR/.dialoginfo"
	./dialog64 64///bits 32///bits
 	case $(cat $TMPDIR/.dialogout) in "1")
		IS64BITS=1
	esac
esac

LIST_32BITS_RELEASES="Alpha///V6.2 Alpha///V6.1 Alpha///V6.0 Alpha///V5.3 Alpha///V5.2 Alpha///V5.1 Alpha///V5 Alpha///V4///PatchFix///1 Alpha///V4 Alpha///V3 Alpha///V2"
LIST_64BITS_RELEASES="Alpha///V7.3 Alpha///V7.2 Alpha///V7.1 Alpha///V7.0"

echo -e "$CHOICE_VERSION" > $TMPDIR/.dialoginfo

case $IS64BITS in "1")
	./dialog64 $LIST_64BITS_RELEASES
	;;
	*)
	case $OS_ARCH in "arm64")
		./dialog64 $LIST_32BITS_RELEASES
		;;
		*)
		./dialog $LIST_32BITS_RELEASES
	esac
esac

termux-setup-storage

case $IS64BITS in "1")
	case $(cat $TMPDIR/.dialogout) in 
		"1")
		echo "$DOWNLOADING MiceWine Alpha V7.3..."
		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.7.3-x64/MiceWine-Alpha-V7.3-ARM64.zip
		;;
		"2")
		echo "$DOWNLOADING MiceWine Alpha V7.2..."
  		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.7.2-x64/MiceWine-Alpha-V7.2-ARM64.zip
		;;
 		"3")
		echo "$DOWNLOADING MiceWine Alpha V7.1..."
		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.7.1-x64/MiceWine-Alpha-V7.1-ARM64.zip
		;;
		"4")
		echo "$DOWNLOADING MiceWine Alpha V7.0..."
		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.7-x64/MiceWine-Alpha-V7.0-ARM64.zip
	esac
	;;
	*)
	case $(cat $TMPDIR/.dialogout) in "11")
    		echo "$DOWNLOADING MiceWine Alpha V2..."	
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.2/MiceWine-Alpha-2.zip
    		;;
   		"10")
    		echo "$DOWNLOADING MiceWine Alpha V3..."
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.3/MiceWine-Alpha-V3.zip
    		;;
    		"9")
    		echo "$DOWNLOADING MiceWine Alpha V4..."
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4/MiceWine-Alpha-V4.zip
    		;;
   		"8")
    		echo "$DOWNLOADING MiceWine Alpha V4 - PatchFix 1..."
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.4-patchfix1/MiceWine-Alpha-V4-Fix-1.zip
    		;;
    		"7")
    		echo "$DOWNLOADING MiceWine Alpha V5..."
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5/MiceWine-Alpha-V5.zip
    		;;
   		"6")
    		echo "$DOWNLOADING MiceWine Alpha V5.1..."
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.1/MiceWine-Alpha-V5.1.zip
    		;;
    		"5")
    		echo "$DOWNLOADING MiceWine Alpha V5.2..."
    		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.2/MiceWine-Alpha-V5.2.zip
    		;;
		"4")
		echo "$DOWNLOADING MiceWine Alpha V5.3..."
		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.5.3/MiceWine-Alpha-V5.3.zip
		;;
		"3")
		echo "$DOWNLOADING MiceWine Alpha V6.0..."
		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.6/MiceWine-Alpha-V6.0-Xmas.zip
 		;;
  		"2")
  		echo "$DOWNLOADING MiceWine Alpha V6.1..." 
   		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.6.1/MiceWine-Alpha-V6.1.zip
		;;
 		"1")
  		echo "$DOWNLOADING MiceWine Alpha V6.2..."
   		curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.6.2/MiceWine-Alpha-V6.2.zip
	esac
esac

echo "$CHECKINGSHA512SUM..."

case $IS64BITS in "1")
	case $(cat $TMPDIR/.dialogout) in
		"1")
		SHA512SUM="a3814722ad433ab83d99a90b1f4d43c07f168fdb5bf7b861611908b96b4df6d236c6ac9cbcbd880faaaf21092e921d866aaf512217053f2a62068a0645c3fb8f"
		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V7.3-ARM64.zip | cut -d" " -f 1)
		;;
		"2")
		SHA512SUM="fc28dbe0b7a20bf001ee6e598f6ed84003e7c0ccfc155a2f97e915de5ebe7a37ed012f01b376aa8ed963cdd24eb2cf5dd6290e94fea5fb94f64000f6c7bd34fa"
		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V7.2-ARM64.zip | cut -d" " -f 1)
		;;
		"3")
		SHA512SUM="bceb429bdeca4256300dda55e18f1f1af977023c71ce70d72837d7eafb3e9e702699180309a41dd9608f9ff16a6bf2f861bbcbd70246dfdffdf4e2f36f989480"
		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V7.1-ARM64.zip | cut -d" " -f 1)
		;;
		"4")
		SHA512SUM="07562e00872abf2d247e8ab9a165f5b1d67e07803504f313ffc872ae8721ffecb34a5f8fc9cdf5eb737b960f63758b7b143e73ae9d29ce45a16742edf9caef4f"
		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V7.0-ARM64.zip | cut -d" " -f 1)
	esac
	;;
	*)
	case $(cat $TMPDIR/.dialogout) in "1") 
		SHA512SUM="de0c4986aed2105a6864e8efc91aed0a88b40e4bd36cc26e1ae2cf0f701bc210ed509fdbd40f00d0d801fe5d422959f854010816c511aabed7b2f796b8f88378"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V6.2.zip | cut -d" " -f 1)
  		;;
		"2")
		SHA512SUM="2120bd455662f068d8dc5b91ee19defd6eb70202416603f8ab6f46fc8ca3814cc937b9d31e2aa2832eb6decb09cca12747252d1dd4681593519905a271aa510b"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V6.1.zip | cut -d" " -f 1)
  		;;
		"3")
		SHA512SUM="ac2d3cbe51ef644ca846d5bdfc673e415a5fb8a2b06b7bec978a29be8838bd9b8708dd90eac0057e5e05a88b9a97974226467be20d7a59a0942a5c641d456f44"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V6.0-Xmas.zip | cut -d" " -f 1)
		;;
		"4")
		SHA512SUM="cda0f03f6ea85e0a3de1c8bf4f41c4358ca6855749f9b633ab1a8223d91ce6106538096d0e5a87da5dacbac37258073e6d53a38ca53cde4a4682c151677dcf86"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V5.3.zip | cut -d" " -f 1)
		;;
		"5")
		SHA512SUM="4a9f899c7f6c9d0e01d441b33d7d503c8f9eee779e3b96231acb455b765479a6e65653e6bc30665218f385298b9508b6e3b4d066c4996fc9205136a1150fad1f"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V5.2.zip | cut -d" " -f 1)
		;;
		"6")
		SHA512SUM="34cfaecfcf90221f485c747063e99e2da56657d9e4462f9097f02438c96fa1c87564e692f3ca86386d9254e4caaa6c07695de079dcea1a10b98db87a46f6a60f"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V5.1.zip | cut -d" " -f 1)
		;;
		"7")
		SHA512SUM="fb84c879eddb8a63af3b2ec306e8843051d8d47adb27dae2fda16e431af91d98469006d944673757efa162d1b03f467cfd6fc0eb530bdc52cf18697ef44ffc98"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V5.zip | cut -d" " -f 1)
		;;
		"8")
		SHA512SUM="8c7b5695384ea9f887f962d8cb4b6239a70135841f6da2a5e23a545f0c3e511d71e809f7f473a03e9e2a2d7ce438921b06c7e9a313adf7a7e63fc354eafd84c5"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V4-Fix-1.zip | cut -d" " -f 1)
		;;
		"9")
		SHA512SUM="b7b8dc4c0b5d53a784f9307985442bd3ad96c97af8a141695ce2e7f8d2cd4786ec5c96a31e17d15ba89e3c68b3885ae7aa697f7140fdf4ee3ec8dc56249e46d5"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V4.zip | cut -d" " -f 1)
		;;
		"10")
		SHA512SUM="98a02545f5ad2fdd6c18433fab8d47ae530d046b6f8bc933323b8933099861b8c59a1a46b51b7c88e1f9e20da8ae13f0542dc00b6774274fd537b7448cfa4606"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-V3.zip | cut -d" " -f 1)
		;;
		"11")
		SHA512SUM="68721e19ad842c5c8af4b7c1ffc225a751da4a9a15924d01e0955ab3e0f1b61187d8857c7a8fa33fafa26cb14d08dde0c708d25fb7e9438f313f31f10e83b1f4"
 		FILESHA512SUM=$(sha512sum MiceWine-Alpha-2.zip | cut -d" " -f 1)
	esac
esac

if [ "$SHA512SUM" != "$FILESHA512SUM" ]; then
	echo "$SHA512SUM_FAILED"
 	rm *.zip dialog*
	exit
fi

case $IS64BITS in "1")
	case $(cat $TMPDIR/.dialogout) in
		"1")
		unzip -o MiceWine-Alpha-V7.3-ARM64.zip -d /data/data/com.termux/files/
		;;
		"2")
		unzip -o MiceWine-Alpha-V7.2-ARM64.zip -d /data/data/com.termux/files/
		;;
		"3")
		unzip -o MiceWine-Alpha-V7.1-ARM64.zip -d /data/data/com.termux/files/
		;;
		"4")
		unzip -o MiceWine-Alpha-V7.0-ARM64.zip -d /data/data/com.termux/files/
	esac
	;;
	*)
	case $(cat $TMPDIR/.dialogout) in "11")
		unzip -o MiceWine-Alpha-2.zip -d /data/data/com.termux/files/
	 	;;
	 	"10")
		unzip -o MiceWine-Alpha-V3.zip -d /data/data/com.termux/files/
		;;
		"9")
		unzip -o MiceWine-Alpha-V4.zip -d /data/data/com.termux/files/
		;;
		"8")
		unzip -o MiceWine-Alpha-V4-Fix-1.zip -d /data/data/com.termux/files/
		;;
		"7")
		unzip -o MiceWine-Alpha-V5.zip -d /data/data/com.termux/files/
		;;
		"6")
		unzip -o MiceWine-Alpha-V5.1.zip -d /data/data/com.termux/files/
		;;
		"5")
		unzip -o MiceWine-Alpha-V5.2.zip -d /data/data/com.termux/files/
		;;
		"4")
		unzip -o MiceWine-Alpha-V5.3.zip -d /data/data/com.termux/files/
	 	;;
	 	"3")
	  	unzip -o MiceWine-Alpha-V6.0-Xmas.zip -d /data/data/com.termux/files/
	   	;;
	    	"2")
	     	unzip -o MiceWine-Alpha-V6.1.zip -d /data/data/com.termux/files/
		;;
		"1")
	 	unzip -o MiceWine-Alpha-V6.2.zip -d /data/data/com.termux/files/
	esac
esac

rm -rf *.zip dialog*

echo -e "$INSTALLDONE"

exit
