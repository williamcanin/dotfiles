# Archlinux Packages

## Export

1 - Export packages official:

```sh
pacman -Qneq > pacman.lst
```

2 - Export packages aur:

```sh
pacman -Qmeq > aur.lst
```

## Install

1 - Install packages official:

```shell
sudo pacman -S --needed --noconfirm - < pacman.lst
```

2 - Install packages aur:

```sh
yay -S --noconfirm - < aur.lst
```

## Extras

## Remove group packages

```sh
pacman -Rns $(pacman -Qqg kde gnome)
```

## Lists all application groups in the repository

```sh
pacman -Sg
```

## Lists all installed application groups

```shell
pacman -Qg
```

## Auto remove

```sh
pacman -Rns $(pacman -Qdtq)
sudo paccache -r
yay -Yc
```
