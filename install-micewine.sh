#!/data/data/com.termux/files/usr/bin/sh
while :; do
clear
echo -e "[ MiceWine -- Alpha V3 ]\n"
echo -e "Você realmente deseja instalar o MiceWine Alpha V3? (S/N)\n:"
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

echo "Baixando o MiceWine Alpha V3..."
curl -# -L -O https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.3/MiceWine-Alpha-V3.zip

echo "Extraindo..."
unzip -o MiceWine-Alpha-V3.zip -d /data/data/com.termux/files/

rm -rf MiceWine-Alpha-V3.zip 

while :; do
echo -e "Deseja instalar a interface XFCE? (S/N)\n"
read xfce

case $xfce in "S"|"s")
	pkg ins xfce4 firefox -y
 	break
done

pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1
termux-x11 :1 &

virgl_test_server_android &

export DISPLAY=:1

echo -e "MiceWine Alpha V3 - Instalado!\n"
echo "Digite: "micewine" para começar usar!"

exit
