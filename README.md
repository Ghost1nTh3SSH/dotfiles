# BSPWM | Polybar themes collection with Theme Selector

Fork from [gh0stzk](https://github.com/gh0stzk/dotfiles) dotfiles adapted for Debian based systems.

## 🌿 Information
3 different themes for BSPWM, Polybar and ZSH Powerlevel10k. With a theme selector to change on the fly.

## :book: Wiki


## Info
<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/edc1ba57-8f4d-4dee-86f7-5a87060ade52" alt="Linux Fetch" align="right" width="450">

|Distro|[Kali](https://www.kali.org/)| 
|:---:|:---:|
|WM|[BSPWM](https://github.com/baskerville/bspwm)|
|Bar|[Polybar](https://github.com/polybar/polybar)|
|Menu|[Rofi](https://github.com/davatorium/rofi)|
|Compositor|[Picom](https://archlinux.org/packages/community/x86_64/picom/)|
|Terminal|[Kitty](https://github.com/kovidgoyal/kitty)|
|Shell|[Zsh](https://archlinux.org/packages/extra/x86_64/zsh/) & [Powerlevel10k](https://github.com/romkatv/powerlevel10k/tree/master)|

<br>

## 🚀 Features
<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/789b6e18-1502-42ae-b717-426905734c4f" alt="Rice Menu" align="right" width="400px">

* **Change themes on the fly:** 3 different Rices now!.

* **Theme Selector:** <code>alt + space bar</code> to launch it.

* **Random wallpaper:**  Every time you switch between rices or reload bspwm with <code>super + alt + r</code> a new wallpaper is set depending on the rice you are on.

* **Wallpaper Changer** <code>super + alt + w</code> changes bethween different wallpapers in the actual rice.

**And more..**

## 🎨 The themes

### 🦑Cthulhu:

|<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/2538e31b-9443-482d-abd9-fde8576f2583" alt="Cthulhu Rice" align="center" width="600px">|<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/fd89da36-3642-49c8-89bc-87e0f43c9c97" alt="Cthulhu Rice" align="center" width="600px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Cthulhu</b></summary>

|<img src="ghost-rice/bspwm/themes/cthulhu/walls/1.jpg" alt="Cthulhu Rice" align="center" width="150px">||<img src="ghost-rice/bspwm/themes/cthulhu/walls/2.jpg" alt="Cthulhu Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/cthulhu/walls/3.jpg" alt="Cthulhu Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/cthulhu/walls/4.jpg" alt="Cthulhu Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/cthulhu/walls/5.jpg" alt="Cthulhu Rice" align="center" width="150px">|

</details>

### 👻Ghost

|<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/8b6d8b08-3038-4c18-b709-0849616cfdb6" alt="Ghost Rice" align="center" width="600px">|<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/0d590dcb-708f-4697-bc0f-d1072ec76bca" alt="Ghost Rice" align="center" width="600px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Ghost</b></summary>

|<img src="ghost-rice/bspwm/themes/ghost/walls/2.jpg" alt="Ghost Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/ghost/walls/3.jpg" alt="Ghost Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/ghost/walls/4.jpg" alt="Ghost Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/ghost/walls/5.jpg" alt="Ghost Rice" align="center" width="150px">|

</details>

### 👽Lain

|<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/02010a0c-f18f-4c56-a090-537c9272a72a" alt="Lain Rice" align="center" width="600px">|<img src="https://github.com/Ghost1nTh3SSH/dotfiles/assets/59705353/bd57928d-380b-4965-ba46-8cbd40aa2b76" alt="Lain Rice" align="center" width="600px">|
|---|---|

<details>
<summary><b>Extra wallpapers in Lain</b></summary>

|<img src="ghost-rice/bspwm/themes/lain/walls/2.jpg" alt="Lain Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/lain/walls/3.jpg" alt="Lain Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/lain/walls/4.jpg" alt="Lain Rice" align="center" width="150px">|<img src="ghost-rice/bspwm/themes/lain/walls/5.jpg" alt="Lain Rice" align="center" width="150px">|

</details>

## Very useful keybindigs to know...
- <code>super + h </code> Display keybindings help.
- <code>alt + @space</code> Display menu to select theme selector.
- <code>super + shift + v</code> Open Visual Studio Code.
- <code>super + shift + f</code> Open Firefox.
- <code>super + shift + b</code> Open Burpsuite.
- <code>ctrl + super + alt + p</code> Power off computer. <code>ctrl + super + alt + r</code> Restart computer.
- <code>super + Return</code> Open a terminal.
- <code>super + Alt + Return</code> Open a floating terminal.
- <code>ctrl + super + alt + k</code> Brute Kill a window/process.
- <code>super + alt + w</code> Changes randomly wallpaper.
- <code>super + alt + r</code> Restart bspwm.

And more.. You need to look sxhkdrc file for more.

## 📦 setup

### 💾 Installation:
The installer only works for **Debian** Linux (I guess that Ubuntu could work as well).

<b>Open a terminal in HOME</b>
- **First download the installer**
```sh
git clone git@github.com:Ghost1nTh3SSH/dotfiles.git
```
- **Now give it execute permissions**
```sh
cd dotfiles
```
- **Finally run the installer**
```sh
./installer.sh
```

## Credits
- [s4vitar](https://github.com/s4vitar) [gh0stzk](https://github.com/gh0stzk/dotfiles) [turquoise-hexagon](https://github.com/turquoise-hexagon/fonts), [adi1090x](https://github.com/adi1090x/widgets), [gabrielzschmitz](https://github.com/gabrielzschmitz), [elenapan](https://github.com/elenapan/dotfiles), [rxyhn](https://github.com/rxyhn/bspdots), [okklol](https://github.com/okklol/eww-bar), [ikz87](https://github.com/ikz87).
