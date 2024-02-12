#!/data/data/com.termux/files/usr/bin/bash
InstallUpdate()
{
  unzip -o "$1" "files" -d "/data/data/com.termux/"
  unzip -o "$1" remove_list &> /dev/zero
  
  for i in $(cat remove_list); do
	  if [ "$operation" == "-" ]; then
	  	rm -rf "$(echo $i | sed "s@///@ @g")"
	  fi

	  if [ "$i" == "-" ]; then
	  	operation="-"
	  else
	  	operation=""
	  fi
  done
}

INSTALLED_MICEWINE_VERSION=$(micewine --version)

LATEST_MICEWINE_64_VERSION="V7.3"
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
    *"V7.1"*)
    echo -e "[ MiceWine -- Update Available ]\nDo you wanna to update for V7.2?" > $TMPDIR/.dialoginfo
    
    micewine-dialog Yes No

    case $(cat $TMPDIR/.dialogout) in "1")
      echo "Downloading MiceWine V7.2 Update..."
      curl -L -O -# https://github.com/KreitinnSoftware/MiceWine/releases/download/v0.0.7.2-x64/MiceWine-Update-V7.2.zip
      InstallUpdate MiceWine-Update-V7.2.zip
      echo "Update Finished. Please Restart Termux for Working as Intended."
      exit
      ;;
      "2")
      exit
    esac
    ;;
    *)
    echo "Your MiceWine installation is out of date and cannot be upgraded now."
    exit
  esac
else 
  case $INSTALLED_MICEWINE_VERSION in *"$LATEST_MICEWINE_32_VERSION"*)
    echo "Your MiceWine installation is up to date."
    exit
    ;;
    *)
    echo "Your MiceWine installation is out of date and cannot be upgraded now."
    exit
  esac
fi
