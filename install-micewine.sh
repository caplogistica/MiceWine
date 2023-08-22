#!/data/data/com.termux/files/usr/bin/sh
while :; do
clear
echo -e "[ MiceWine -- Alpha 2 ]\n"
echo -e "Você realmente deseja instalar o MiceWine Alpha 2? (S/N)\n:"
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

echo "Baixando o MiceWine Alpha 2..."
curl -# -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.2/MiceWine-Alpha-2.zip

echo "Extraindo..."
unzip MiceWine-Alpha-2.zip -d /data/data/com.termux/files/

rm -rf MiceWine-Alpha-2.zip 

echo -e "MiceWine Alpha 2 - Instalado!\n"
echo "Pressione qualquer tecla para sair."

read