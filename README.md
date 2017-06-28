My humble swiss army knife for getting work done. Includes config files for vim, zsh, git, and others. Regularly used (and considered tested) on Ubuntu, CentOS, and macOS.

# Setup

Usage requires git – vim and zsh recommended. Clone the repository (best into `~/.dotfiles`), and run `install-dotfiles.sh`. This will update all submodules, create symlinks and set the shell up.


## Ubuntu or macOS

```bash
sudo apt-get install git vim zsh htop || brew install git vim zsh htop
git clone https://github.com/janwh/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/install-dotfiles.sh
```

## CentOS 7

```bash
# EPEL for htop and sane package availability
wget http://dl.fedoraproject.org/pub/epel/7/x86_64/e/epel-release-7-9.noarch.rpm
rpm -ihv epel-release-7-9.noarch.rpm

yum install zsh vim git htop

git clone https://github.com/janwh/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/install-dotfiles.sh
```
