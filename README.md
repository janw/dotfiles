My personal set of config files for vim, zsh (and probably more to come)

# Installing

Simply clone the repository, `cd` into the directory and run `./install-dotfiles.sh`. This will update all submodules, create symlinks and even set the necessary fonts for powerline (tested on OSX and Ubuntu).

To fully utilize the installed powerline font (currently Source Code Pro), you have to adjust the selected font of your Terminal application. On OSX there are Terminal themes included for Solarized Dark and Light.

## Firefox user interface styling

I recently started working on a Firefox theme, utilizing the [Stylish extension](https://addons.mozilla.org/de/firefox/addon/stylish/) to customize the GUI to an extend. Currently the theme is an homage to <strike>almost</strike> [i3](https://i3wm.org/)'s default colors. The stylesheet can be added by navigating to `about:addons`, selecting "User Styles" in the sidebar, clicking on "Install from URLs" and entering the following URL:

```
https://raw.githubusercontent.com/Janwillhaus/.dotfiles/master/firefox.css
```

Make sure to keep the theme auto-updating — it's a work-in-progress.

# Future plans

I am just starting out to harness the potential of all the dotfiles out there and haven't used vim before either. I'll likely add a few other things to this repo, for example vim plugins as I learn more about it all.
