#!/data/data/com.termux/files/usr/bin/bash
INSTALLED_MICEWINE_VERSION=$(micewine --version)

LATEST_MICEWINE_64_VERSION="V7.1"
LATEST_MICEWINE_32_VERSION="V6.2"

echo "Installed Version: $INSTALLED_MICEWINE_VERSION"

case $(uname -m) in "aarch64")
  IS64BITS=1
  ;;
  *)
  IS64BITS=0
esac

if [ $IS64BITS == 1 ]; then
  case $INSTALLED_MICEWINE_VERSION in *"$LATEST_MICEWINE_64_VERSION"*)
    echo "Your MiceWine installation is up to date."
    exit
    ;;
    *)
    echo "Your MiceWine installation is out of date"
  esac
else 
  case $INSTALLED_MICEWINE_VERSION in *"$LATEST_MICEWINE_32_VERSION"*)
    echo "Your MiceWine installation is up to date."
    exit
    ;;
    *)
    echo "Your MiceWine installation is out of date"
  esac
fi
