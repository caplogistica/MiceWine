# MiceWine
MiceWine is a project that aims to run Windows applications and games on Android smartphones.

It uses a customized build of Wine compiled for Android and Box86 to run in the best possible way, STILL IN DEVELOPMENT.

To install the Alpha version use on a clean Termux:

`curl -O https://raw.githubusercontent.com/KreitinnSoftware/MiceWine/main/install-micewine.sh; bash install-micewine.sh`

After installed, run micewine <program> on your termux to open micewine, for example: 

`micewine TFM` , to open TFM

`micewine taskmgr` , to open Task Manager

# Open Source Applications used on MiceWine:

- [Box86](https://github.com/ptitSeb/box86)
- [WineHQ](https://gitlab.winehq.org/wine/wine)
- [Termux](https://github.com/termux/termux-app)
- [Termux-X11](https://github.com/termux/termux-x11)
- [Mesa](https://gitlab.freedesktop.org/mesa/mesa)
