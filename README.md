# My dotfiles

I'm using GNU Stow to manage my configuration for now.

Each directory in `files/` is a stow package. Run `./bootstrap.sh` to link
them all into `$HOME`; a conflicting package is skipped and reported.
Run `stow -n -v --target ~ <pkg>` from `files/` for a dry run.

Wayland only (sway, waybar, kitty). darkman switches kitty themes.

Not tracked: `~/.ssh` keys, `known_hosts` and generated `config`
(public hosts live in `files/ssh/.ssh/config.d/public`).

## Notes for self:

Things that just dotfiles will miss out:

1. [scripts repo](https://github.captnemo.in/scripts)
1. `~/bin` directory, which I don't version control.
1. Wallpapers
1. nvm
1. rvm
1. npm preinstalled packages

## LICENSE

CC-BY-SA
