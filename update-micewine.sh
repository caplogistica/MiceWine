#!/data/data/com.termux/files/usr/bin/bash
INSTALLED_MICEWINE_VERSION=$(micewine --version)

LATEST_MICEWINE_VERSION="V7.1"

echo "Installed Version: $INSTALLED_MICEWINE_VERSION"

case $(uname -m) in "aarch64")
  IS64BITS=1
  ;;
  *)
  IS64BITS=0
esac

case $INSTALLED_MICEWINE_VERSION in *"$LATEST_MICEWINE_VERSION"*)
  echo "Your MiceWine installation is up to date."
  exit
  ;;
  *)
  echo "Your MiceWine installation is out of date"
esac
