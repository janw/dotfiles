# My Dotfiles

This repository contains humble swiss army knife for getting work done. It includes config files for vim, zsh, git, and others. Regularly used (and considered tested) only on macOS, but a reduced set of features should also work on Linux e.g. Ubuntu.

## Setup

Usage requires git – vim and zsh recommended. Clone the repository (expected into `~/.dotfiles`), and run the [dotbot installer script](https://github.com/anishathalye/dotbot/). This will update all submodules, and create necessary symlinks.

```bash
git clone https://github.com/janwh/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/install
```


### Install required packages on …

#### … Ubuntu or macOS

```bash
sudo apt-get install git vim zsh htop
```

#### … CentOS 7

```bash
# EPEL for htop and sane package availability
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
rpm -ihv epel-release-7-9.noarch.rpm

yum install zsh vim git htop
```
