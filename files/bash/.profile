# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PATH="/usr/local/sbin:/usr/local/bin:/usr/bin:/usr/bin/site_perl:/usr/bin/vendor_perl:/usr/bin/core_perl:$HOME/bin:/sbin:$HOME/projects/scripts/:$HOME/.node_modules/bin:$HOME/.gem/ruby/2.5.0/bin:/home/nemo/.local/bin:$HOME/bin:/bin"
export npm_config_prefix=~/.node_modules
export GOPATH="/home/nemo/projects/go"
PATH="/usr/sbin:/usr/games:$PATH"

# Make sure qt5-styleplugins is installed for this to work
# https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications#Theme_engines
export QT_QPA_PLATFORMTHEME=gtk2