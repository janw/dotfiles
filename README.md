My personal set of config files for vim, zsh, git (and probably more to come). It has been tested to work on macOS, and Ubuntu.

# Installing

Simply clone the repository, and run `./install-dotfiles.sh`. This will update all submodules, create symlinks and even add the necessary fonts for Powerline themes ([Powerlevel9k](https://github.com/bhilburn/powerlevel9k), [vim-airline](https://github.com/vim-airline/vim-airline))

This of course requires at least `git` to be installed, `vim` and `zsh` are recommended, too.

```bash
sudo apt-get install git vim zsh || brew install git vim zsh
git clone https://github.com/janwh/dotfiles.git ~/.dotfiles
sh ~/.dotfiles/install-dotfiles.sh
```

To fully utilize the installed powerline font (currently Source Code Pro), you have to adjust the selected font of your Terminal application. On OSX there are Terminal themes included for Solarized Dark and Light.

# Future plans

I am just starting out to harness the potential of all the dotfiles out there and haven't used vim before either. I'll likely add a few other things to this repo, for example vim plugins as I learn more about it all.
