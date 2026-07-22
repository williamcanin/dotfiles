# Debian Packages

1 - Export packages:

```sh
dpkg -l | grep ^ii | sed 's_  _\t_g' | cut -f2 > packages.lst
```

2 - Install packages:

```sh
sudo apt install $(cat packages.lst | awk '{print $1}')
```
