![MiceWine Logo](img/MiceWine-Logo-Xmas.png "MiceWine Logo")

# MiceWine

MiceWine is a project that aims to run Windows applications and games on Android smartphones.

It uses a customized build of Wine compiled for Android and Box86 to run in the best possible way, STILL IN DEVELOPMENT.

To install the Alpha version use on a clean Termux:

`curl -O https://raw.githubusercontent.com/KreitinnSoftware/MiceWine/main/install-micewine.sh; bash install-micewine.sh; . $PREFIX/etc/termux-login.sh`

After installed, run `micewine` on your termux to open MiceWine.

⚠️ Install Termux and Termux-X11 from Releases Page ⚠️

### Compatible Android Versions

| Android    | Support     |
| ---------- | ----------- |
| Android 9  | Unsupported |
| Android 10 | Supported   |
| Android 11 | Supported   |
| Android 12 | Supported   |
| Android 13 | Supported   | 
| Android 14 | Not tested  |

### Compatible GPUs

| GPU        | Support             | Driver            |
| ---------- | ------------------- | ----------------- |
| Adreno 7xx | Parcially Supported | VirGL/Zink        |
| Adreno 6xx | Supported           | Turnip/VirGL/Zink |
| Others     | Supported           | VirGL/Zink        |

⚠️ In theory, any GPU that supports Vulkan should work with Zink, and any GPU should work through VirGL. ⚠️

# Open Source Applications used on MiceWine:

- [Box86](https://github.com/ptitSeb/box86)
- [WineHQ](https://gitlab.winehq.org/wine/wine)
- [Termux](https://github.com/termux/termux-app)
- [Termux-X11](https://github.com/termux/termux-x11)
- [Mesa](https://gitlab.freedesktop.org/mesa/mesa)

Merry Christmas!
