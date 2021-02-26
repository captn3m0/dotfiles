#!/bin/bash

pathadd() {
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        PATH="${PATH:+"$PATH:"}$1"
    fi
}

# Read a gemfile contents
# https://stackoverflow.com/a/43298099
gemread() {
  tar --to-stdout -xf "$1" data.tar.gz | tar -zt
}

pathadd '/home/nemo/bin'
pathadd '/home/nemo/projects/go/bin'
pathadd '/bin'
pathadd '/snap/bin'

pathadd /home/nemo/.local/share/junest/bin

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)

function gemls(){
  tar --to-stdout -xf "$1" data.tar.gz | tar -zt
}
alias adb.run='apktool build src/ -o patched.apk && java -jar ~/apps/uber-apk-signer-1.1.0.jar -a patched.apk  && adb install -r -d patched-aligned-debugSigned.apk && adb shell monkey -p '$1' -v 1'
alias mk='microk8s.kubectl'
alias settings='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'
alias watch='watch '
alias xclip='xclip -selection c'
alias sl=ls
alias dynamodump='docker run bchew/dynamodump /usr/local/bin/dynamodump'
alias wine32='WINEARCH=win32 WINEPREFIX=~/win32 wine'
alias signal_update='sss docker && docker run captn3m0/signal-arch-builder'
alias kc='kapitan compile'
# https://tizardsbriefcase.com/1059/linux/remove-query-string-filename-wget
alias clean.filenames='for file in *; do mv "$file" "${file%%\?*}"; done'

alias dunst.pause='notify-send "DUNST_COMMAND_PAUSE"'
alias dunst.resume='notify-send "DUNST_COMMAND_RESUME"'
# ... or force ignoredups and ignorespace
pathadd '/sbin'
pathadd '/home/nemo/projects/scripts/'
pathadd "$HOME/.phpenv/bin"
pathadd "$HOME/apps/ec2/bin"
pathadd "$HOME/.gem/ruby/2.7.0/bin"
# needs a kubectl upgrade
pathadd "$HOME/.krew/bin"
pathadd "$HOME/.local/bin"

# slows shell for now.
source <(kubectl completion bash)
# Enable kubectl completion with k
complete -F __start_kubectl k


# https://substrakt.com/journal/easy-peasy-composer-local-package-symlink-composer-link/
composer-link() {
  jq '.repositories |= [{"type": "path", "url": "'$1'", "options": {"symlink": true}}] + . ' composer.json > composer.tmp.json && mv composer.tmp.json composer.json

  packageName=$(jq -r '.name' $1/composer.json)

  composer require $packageName @dev
}

composer-unlink() {
  git checkout composer.json composer.lock
  composer update
}

# These 2 methods change the color scheme for my:
# 1. Editor (sublime text)
# 2. Terminal (alacritty)
# 3. bat
# 4. Monitor brightness (only one of the monitors). See https://github.com/rockowitz/ddcutil/issues/140
# 5. Gtk theme

export ALACRITTY_COLOR_DIR=/home/nemo/projects/personal/dotfiles/files/themes/.config/alacritty/themes/colors
export BAT_THEME="Solarized (light)"
GTK_THEME_dark="NumixSolarizedDarkViolet"
GTK_THEME_light="NumixSolarizedLightGreen"
BRIGHTNESS_dark=0
BRIGHTNESS_light=99

function colorchange() {
  export BAT_THEME="Solarized ($1)"
  echo "✔️ bat"

  alacritty-colorscheme -C "$ALACRITTY_COLOR_DIR" -a "base16-solarized-$1.yml"
  echo "✔️ alacritty"

  gtk_theme="GTK_THEME_$1"
  xfconf-query -c xsettings -p /Net/ThemeName -s "${!gtk_theme}"
  echo "✔️ gtk"

  subl_settings="/home/nemo/.config/sublime-text-3/Packages/User/Preferences.sublime-settings"
  strip-json-comments "$subl_settings" | jq ".color_scheme=\"Packages/Solarized Color Scheme/Solarized ($1).sublime-color-scheme\"" > /tmp/sublime.json
  mv /tmp/sublime.json "$subl_settings"
  echo "✔️ sublime"

  brightness="BRIGHTNESS_$1"
  if [[ $(xrandr --listmonitors|grep 2560) ]]; then
    ddcutil --model "LG ULTRAWIDE" setvcp 0x10 ${!brightness}
  fi
  echo "✔️ monitor"
}

alias dark="colorchange dark"
alias light="colorchange light"

# https://prefetch.net/blog/2020/07/14/decoding-json-web-tokens-jwts-from-the-linux-command-line/
jwtd() {
    if [[ -x $(command -v jq) ]]; then
         jq -R 'split(".") | .[0],.[1] | @base64d | fromjson' <<< "${1}"
         echo "Signature: $(echo "${1}" | awk -F'.' '{print $3}')"
    fi
}

if [ -f /usr/sbin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=~/.virtualenvs
  export VIRTUALENVWRAPPER_SCRIPT=/usr/sbin/virtualenvwrapper.sh
  source /usr/sbin/virtualenvwrapper_lazy.sh
fi

alias sublime='/usr/bin/sublime-text'
alias subl3=subl
alias chrome='chromium-browser'
alias gp='git push'
alias subtitles='subliminal -p addic7ed -l en -s -- $1'
alias pu='phpunit'
alias ghpr='gh pull-request'
alias ssdr='sudo systemctl daemon-reload'
alias cat='bat'
alias fomu.setup='export PATH=/home/nemo/apps/fomu/bin:$PATH'

# Gets list of all packages from AUR sorted by Size
alias aur.list='expac -H M "%m\t%n" | sort -h  > /tmp/expac.txt && pacman -Qqm > /tmp/aur.txt  && grep --color=never -w -F -f /tmp/aur.txt /tmp/expac.txt'
# Same as above, but all packages (except AUR)
alias package.list='expac -sH M "%-30n %m" | sort -hk 2'
alias package.owns='pacman -F'
# Download size of all packages marked for upgrade
alias package.dlsize='expac -S -H M '%k\t%n' $(pacman -Qqu) | sort -sh'
# To list the packages marked for upgrade with their download size
alias upgrade.size='pacman -Quq|xargs expac -SH M "%k\t%n" | sort -sh'

# https://github.com/chef/inspec
function inspec { docker run -it --rm -v $(pwd):/share chef/inspec $@; }

function pingen { pwgen -1Avs -r=qwertyuiopasdfghjklzxcvbnm "$1"; }

function sortinplace { sort -o "$1" "$1"; }

# alias kapitan='docker run -t --rm -u $(id -u) -v $(pwd):/src:delegated deepmind/kapitan'
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes
color_prompt=yes
export TERM=xterm-256color

# enable color support of ls and also add handy aliases
if [[ -x /usr/bin/dircolors ]]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# Drone related stuff
export DRONE_SERVER=https://drone.razorpay.com

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# k8s
alias k='kubectl'
alias kontext='kubectl config use-context'
alias kgpa='kubectl get pods --all-namespaces'
alias kgp='kubectl get pods -o wide'
alias kgpn='kubectl get pods -o wide -n '
alias kno='kubectl get nodes'

# https://twitter.com/indradhanush92/status/1003493096158420992
# kubectl and minikube completion is moved to /etc/bash_completion.d/

function kpssh() { kubectl exec -it $1 -n $2 sh ; }
function kcssh() { kubectl exec -it $1 -n $2 -c $3 sh ; }
function klog() { kubetail $1 -n $1 ; }
function kne() {
    kubectl get events -n $1 --sort-by='.metadata.creationTimestamp' \
    -o 'go-template={{range .items}}{{.involvedObject.name}}{{"\t"}}{{.involvedObject.kind}}{{"\t"}}{{.message}}{{"\t"}}{{.reason}}{{"\t"}}{{.type}}{{"\t"}}{{.firstTimestamp}}{{"\n"}}{{end}}'
}

# Export a secret automatically with the filename on pass
function gettoken() {
    export "`basename $1`"="$(pass show $1)"
}

# Get inotify listener counts
function inotifytop() {
    for foo in /proc/*/fd/*; do readlink -f $foo; done |grep inotify |cut -d/ -f3 |xargs -I '{}' -- ps --no-headers -o '%p %U %a' -p '{}' |uniq -c |sort -n
}

## COMPLETION SCRIPTS

if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
   . /etc/bash_completion
fi

if [[ -f /usr/share/bash-completion/completions/pipenv ]] && ! shopt -oq posix; then
   . /usr/share/bash-completion/completions/pipenv
fi

if [[ -f /usr/share/bash-completion/completions/pass ]] && ! shopt -oq posix; then
   . /usr/share/bash-completion/completions/pass
fi

if [[ -f /usr/share/bash-completion/completions/poetry ]] && ! shopt -oq posix; then
   . /usr/share/bash-completion/completions/poetry
fi

if [[ -f /usr/share/doc/pkgfile/command-not-found.bash ]] && ! shopt -oq posix; then
   . /usr/share/doc/pkgfile/command-not-found.bash
fi

if [[ -f /usr/share/git/completion/git-completion.bash ]] && ! shopt -oq posix; then
  . /usr/share/git/completion/git-completion.bash
fi

function smallmkv() { ffmpeg -i "$1" -b 1000k -acodec libmp3lame -vcodec libx264 -ar 44100 -ab 56k -ac 2 -vpre fast -crf 24 \ "$1.mkv" ;}
export LC_ALL=en_US.utf8
export LC_ALL=en_US.utf8
export LANG=C

# Checkout an older commit
function gco_date() {
  git checkout `git rev-list -n 1 --before="$1" master`
}

function make_aoc() {
    pdftk $1 cat 1 output 1-$1
    pdftk 1-$1 aoc.pdf cat output aoc-$1
}

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

# autoload -U compinit
# compinit
export BLOCKSIZE=K
# export CDPATH=.:~:~/src:/etc
# export DISPLAY=:79
export EDITOR='nvim'
# export ftp_proxy=${MY_PROXY}
# export GPG_TTY='tty'				# gpg-agent says it needs this
# export GREP_OPTIONS='-D skip --binary-files=without-match --ignore-case'		# most commonly used grep options
# put list of remote hosts in ~/.hosts ...
export HOSTFILE=$HOME/.hosts
# export IGNOREEOF=1				# prevent CTRL-D from immediately logging out
# export INPUTRC=/etc/inputrc			# it's possible that this will make bash find my delete key (and everything else)((but i don't think it did))
# export INPUTRC=$HOME/.inputrc			# type in ‘whatever’ and press ‘Page Up’ key and bash automatically fetches last command that starts with whatever and completes the command for you (requires '$HOME/.inputrc' with these lines: #Page up/page down && "\e[5~": history-search-backward && "\e[6~": history-search-forward)
export LC_COLLATE="en_US.utf8"		# change sorting methods [a-Z] instead of [A-Z]
export LESSCHARSET="UTF-8"
export LESS='-i -n -w  -z-4 -g -e -M -X -F -Q -R -P%t?f%f \'
# export LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'	# use this if lesspipe.sh exists
# export LESS_TERMCAP_mb=$'\E[01;31m'      	# less colors for Man pages # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  	# less colors for Man pages # begin bold
export LESS_TERMCAP_me=$'\E[0m'           	# less colors for Man pages # end mode
export LESS_TERMCAP_se=$'\E[0m'           	# less colors for Man pages # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    	# less colors for Man pages # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           	# less colors for Man pages # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' 	# less colors for Man pages # begin underline
# export MY_PROXY='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# export OOO_FORCE_DESKTOP=gnome   		# openoffice preferences
export PAGER='less -e'
# export PILOTRATE=57600			# make pilot-xfer go faster than 9600
export TERM='xterm'
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
# export USER_CLIENT=deluge
# export USER_DPRT=22218
# export USER_OPRT=47426
# export USER_VPRT=79
# export USER_WPRT=30818
# export VISUAL='subl'
# export wpsetters=feh
# ${file%\.[^.]*}				# to remove filename extensions in bash
# fortune -a					# fortunes at each new shell
# mesg n              				#
set -b						# causes output from background processes to be output right away, not on wait for next primary prompt
# set bell-style visible			# I hate noise
#set completion-ignore-case on 		# complete things that have been typed in the wrong case
# set -o ignoreeof				# can't c-d out of shell
# set -o noclobber				# disallow > to work on files that already exist (prevents catting over file)
set -o notify					# notify when jobs running in background terminate
# set -o nounset				# attempt to use undefined variable outputs error message and forces exit (messes up completion if enabled)
# set +o nounset          			# otherwise some completions will fail
#setopt autopushd pushdminus pushdsilent pushdtohome
# setopt correct
# setopt extendedglob
# setopt hist_verify          			# verify when using !
# setopt nocheckjobs          			# don't complain about background jobs on e
# setopt no_clobber           			# don't overwrite files when redirect
# setopt nohup               			# don't kill bg jobs when tty quits
# setopt printexitvalue       			# print exit value from jobs
# setopt share_history
# set -o xtrace					# useful for debuging
# setterm -blength 0				# set the bell duration in milliseconds (silence the beeps)
# set visible-stats on 				# when listing possible file completions, put / after directory names and * after programs
shopt -s cdable_vars				# set the bash option so that no '$' is required (disallow write access to terminal)
shopt -s cdspell				# this will correct minor spelling errors in a cd command
shopt -s checkhash
shopt -s checkwinsize				# update windows size on command
shopt -s cmdhist          			# save multi-line commands in history as single line
shopt -s dotglob				# files beginning with . to be returned in the results of path-name expansion
# shopt -s expand aliases			# expand aliases
shopt -s extglob				# necessary for bash completion (programmable completion)
shopt -s globstar				# enables the ** globbing operator
shopt -s histappend histreedit histverify
shopt -s hostcomplete     			# attempt hostname expansion when @ is at the beginning of a word
# shopt -s huponexit
#shopt -s mailwarn				# keep an eye on the mail file (access time)
# shopt -s nocaseglob cdspell histappend
shopt -s nocaseglob       			# pathname expansion will be treated as case-insensitive (auto-corrects the case)
shopt -s no_empty_cmd_completion		# no empty completion (bash>=2.04 only)
# shopt -s nullglob dotglob
shopt -s sourcepath
# shopt -u cmdhist				# do not treat multiple line commands as a single entry
shopt -u force_fignore			# expand to complete an ignored word, if no other words match.
# shopt -u mailwarn
# shopt -u sourcepath
# stty -ixon					# disable XON/XOFF flow control (^s/^q)
stty start undef
stty stop undef
stty stop ''					# use C-s to search forward through history (do not block output)
ulimit -c unlimited				# let me have core dumps
# ulimit -S -c 0          			# (core file size) don't want any coredumps
# ulimit -S -f 1024   				# open files
# ulimit -S -s 8192  				# stack size
# ulimit -S -u 256    				# max user processes
# umask 007    					# all files created 660, dirs 770
# umask 022					# makes new files have permissions: rwxr-xr-x
# umask 077           				# after everything is installed, uncomment this and the mkdir alias below ((base 8) 777 & ~077 = 700 = u=rwx,g=,o=)
#unset MAILCHECK        				# don't want my shell to warn me of incoming mail
# unsetopt bgnice            			# don't nice bg command


# To create a ZIP archive of a file or folder	 #
function zipf() { zip -r "$1".zip "$1" ; }

# Custom Functions For adding and fetching covers from a pdf
function addcover() { convert "$2" /tmp/cover.pdf; pdftk /tmp/cover.pdf "$1" cat output /tmp/final.pdf;mv /tmp/final.pdf "$1"; }
function getcover() { pdftk "$1" cat 1 output /tmp/cover.pdf; convert /tmp/cover.pdf cover.jpg;}

##################################################
# Directory shortcuts				 #
##################################################

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

alias gitci='git commit -a -m'
alias la_='ls -Al'									# show hidden files
alias l?='cat ~/technical/tips/ls'
alias lc='ls -ltcr'       								# sort by and show change time, most recent last
alias ldir='ls -lhA |grep ^d'
alias ld='ls -ltr' 									# sort by date
alias lfiles='ls -lhA |grep ^-'
alias lf="ls -Alh --color | awk '{k=0;for(i=0;i<=8;i++)k+=((substr(\$1,i+2,1)~/[rwx]/)*2^(8-i));if(k)printf(\" %0o \",k);print}'"	# full ls with octal+symbolic permissions
alias lgg='ls --color=always | grep --color=always -i'					# quick case-insenstive partial filename search
alias lh='ls -Al' 									# show hidden files
alias lh='ls -lAtrh' 									# sort by date and human readable
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'
alias li='ls -ai1|sort' 								# sort by index number
alias linecount='wc -l $1'								# count number of lines in text file
alias lk='ls -lSr'									# sort by size
alias llllll='ls -FlaXo --color=auto'							# sort the extensions alphabetically; good for winfiles
alias lllll='ls -Fla --full-time -o -Q --color=auto'					# whatever
alias llll='ls -laS --color=auto'							# sort by size
alias lll='ls -Falot --color=auto'							# sort by mod time
alias ll_='ls -l'									# long listing
alias l.='ls -d .[[:alnum:]]* 2> /dev/null || echo "No hidden file here..."'		# list only hidden files
alias l='ls -hF --color'								# quick listing
alias lm_='ls -al |more'    								# pipe through 'more'
alias ln='ln -s'
alias lr='ls -lR'									# recursice ls
alias lrt='ls -lart'									# list files with last modified at the end
alias lsam='ls -am' 									# List files horizontally
alias lsdd='ls -latr'                                 					# sort by date
alias lsd='ls -l | grep "^d"'								# list only directories
alias lsize='ls --sort=size -lhr'							# list by size
alias lsl='ls -lah'                                   					# long list, human-readable
alias ls='ls -hF --color'								# add colors for filetype recognition
alias lsnew='ls -Alh --color=auto --time-style=+%D | grep `date +%D`'
alias lss='ls -shaxSr'                         			       			# sort by size
alias lsss='ls -lrt | grep $1'								# to see something coming into ls output: lss
alias lsx='ls -ax' 									# sort right to left rather then in columns
alias lt_='ls -alt|head -20' 								# 20, all, long listing, modification time
alias lt='ls -ltr'         								# sort by date, most recent last
alias lu='ls -ltur'        								# sort by and show access time, most recent last
alias lx='ls -lXB'									# sort by extension
alias sss='sudo systemctl start'
alias sse='sudo systemctl enable'
alias ssd='sudo systemctl disable'
alias ssS='sudo systemctl stop'
alias ssh="cat ~/.ssh/config.d/p* > ~/.ssh/config; ssh"
alias ssr='sudo systemctl restart'
alias cda='composer dump-autoload'

#### FASD
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='j'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection

source /etc/profile.d/autojump.bash
alias vim='nvim'

#### Docker
# docker run image
alias dri='docker run --volume /home/nemo/tmp:/data --tty --rm --interactive --entrypoint /bin/sh '
# Better caching: https://github.com/moby/moby/issues/15717
export DOCKER_BUILDKIT=1
# docker run image, but with current directory mounted as /current
# Do not run this on untrusted images
alias dri_cwd='docker run --volume `pwd`:/current --volume /home/nemo/tmp:/data --tty --rm --interactive --entrypoint /bin/sh '
alias ctop='docker run --name ctop -it --rm -v /var/run/docker.sock:/var/run/docker.sock:ro quay.io/vektorlab/ctop '

alias dockerlint='LC_ALL=C hadolint'

##### Terraform
alias t=terraform
alias tp='terraform plan'
alias tpt='terraform plan --target '
alias ta='terraform apply'
alias tat='terraform apply --target '
alias tfa='terraform apply --auto-approve'
alias tfat='terraform apply --auto-approve --target '
alias tfit='terraform init'

##### History Shenanigans
export HISTCONTROL=ignorespace:ignoredups:erasedups        # for 'ignoreboth': ignore duplicates and /^\s/
export HISTFILE='/home/nemo/.bash_history'
# export HISTFILESIZE=10000         # increase or decrease the size of the history to '10,000'
# export HISTFILESIZE=${HISTSIZE}       # bash will remember 'N' commands
export HISTIGNORE='&:bg:fg:ll:h'
export HISTIGNORE='${HISTIGNORE:+$HISTIGNORE:}la:ll:lah:lat:;a:-:fg:bg:j:sync:esu:rma:rmp:fol:pfol'
export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
export HISTIGNORE='pwd:cd:ls:ls -l:'       # ignore commands given
#export HISTSIZE=10000              # increase or decrease the size of the history to '10,000'
export HISTTIMEFORMAT='| %d/%m/%y %T | '  # make 'History' Show The Date For Each Command
# export HISTTIMEFORMAT='%F %T '        # adds date and time to history
#export HISTTIMEFORMAT='%H:%M > '
# export HISTTIMEFORMAT='%s'            # the beloved Second of Our Linux
# export HISTTIMEFORMAT='%Y-%b-%d::%Hh:%Mm:%Ss '
#export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a  ' # makes history display in YYYY-MM-DD_HH:MM:SS_3CharWeekdaySpaceSpace format
unset HISTFILESIZE                # infinite History
unset HISTSIZE                # infinite History
# append to the history file, don't overwrite it
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000
HISTFILESIZE=1000000
shopt -s histappend

# Don't use this for sensitive files
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
    tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

export JAVA_HOME=/usr/lib/jvm/default-runtime
export EC2_HOME=/home/nemo/apps/ec2
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"

# added by travis gem
[ -f /home/nemo/.travis/travis.sh ] && source /home/nemo/.travis/travis.sh
#[[ -s "/home/nemo/.gvm/scripts/gvm" ]] && source "/home/nemo/.gvm/scripts/gvm"

#PERL_MB_OPT="--install_base \"/home/nemo/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/nemo/perl5"; export PERL_MM_OPT;
#eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)

# Manage multiple Git identities
# karn https://github.com/prydonius/karn
if command -v karn > /dev/null; then eval "$(karn init)"; fi

# Disable beeps
xset -b

# function make-completion-wrapper () {
#     local function_name="$2"
#     local arg_count=$(($#-3))
#     local comp_function_name="$1"
#     shift 2
#     local function="
# function $function_name {
#     ((COMP_CWORD+=$arg_count))
#     COMP_WORDS=( "$@" \${COMP_WORDS[@]:1} )
#     "$comp_function_name"
#     return 0
# }"
#     eval "$function"
#     echo $function_name
#     echo "$function"
# }


# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
# colorized man pages
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LC_ALL=C \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        MANWIDTH=$(expr $COLUMNS - 4) \
            man "$@"
}

# Overrides the display provided by imagemagick
function display() {
    if [[ `which autorandr` ]]; then
      autorandr
    else
      echo "[warn] Reminder to switch to autorandr"
      layout="$1"
      if [[ "$1" == "toggle" ]]; then
          # exchange it
          CURRENT=$(cat ~/.screenlayout/current)
          echo "current=$CURRENT"
          case "$CURRENT" in
              "office")
                  layout="single"
                  ;;
              "single")
                  layout="office"
                  ;;
          esac
      fi
      echo "layout=$layout"
      if [[ "$layout" == "home" ]]; then
          xrandr --newmode "2560x1080_60.00"  \
              230.00  2560 2720 2992 3424  \
              1080 1083 1093 1120 -hsync +vsync
          xrandr --addmode HDMI1 "2560x1080_60.00"
      fi
      if [[ -a ~/.screenlayout/$layout.sh ]]; then
          `cd ~/.screenlayout && sh $layout.sh`
          # Write the current layout
          echo $layout > ~/.screenlayout/current
          if [[ -e "~/Pictures/$layout.jpg" ]]; then
              (cd ~/Pictures && cp "$layout.jpg" "./xin_1.jpg")
          fi
          sleep 3
          nitrogen --restore
          i3-msg reload
          # dunst doesn't like screensize changes
          killall dunst;notify-send "Display Switched"
      fi
    fi
}

function mkcd() {
    mkdir "$1"
    cd "$1"
}

# To allow global package installations for the current user
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

if type complete &>/dev/null; then
  _npm_completion () {
    local words cword
    if type _get_comp_words_by_ref &>/dev/null; then
      _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
    else
      cword="$COMP_CWORD"
      words=("${COMP_WORDS[@]}")
    fi

    local si="$IFS"
    IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
                           COMP_LINE="$COMP_LINE" \
                           COMP_POINT="$COMP_POINT" \
                           npm completion -- "${words[@]}" \
                           2>/dev/null)) || return $?
    IFS="$si"
    if type __ltrim_colon_completions &>/dev/null; then
      __ltrim_colon_completions "${words[cword]}"
    fi
  }
  complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
elif type compctl &>/dev/null; then
  _npm_completion () {
    local cword line point words si
    read -Ac words
    read -cn cword
    let cword-=1
    read -l line
    read -ln point
    si="$IFS"
    IFS=$'\n' reply=($(COMP_CWORD="$cword" \
                       COMP_LINE="$line" \
                       COMP_POINT="$point" \
                       npm completion -- "${words[@]}" \
                       2>/dev/null)) || return $?
    IFS="$si"
  }
  compctl -K _npm_completion npm
fi
###-end-npm-completion-###

# Stolen from @ThatHarmanSingh
function sprint() {

# Set time format to unix so we can subtract
 HISTTIMEFORMAT='%s ' history |
 # History returns way more than needed
  tail -n 4000 |
  # Grep for git commits (after timestamps)
  grep -E '^\d+\s+\d+\s+gc' |
  # Max 15 days ago
  awk -v now=$(date +%s) '(now - $2) < 15*24*60*60' |
  # Cut out the timestamps for uniq check
  cut -d ' ' -f 4- |
  # To handle multiple commit-pull-reset-commit cycles
  uniq
}

# https://github.com/uber/makisu
#
function makisu_build() {
    makisu_version=${MAKISU_VERSION:-v0.1.10}
    cd ${@: -1}
    docker run -i --rm --net host \
        -v /var/run/docker.sock:/docker.sock \
        -e DOCKER_HOST=unix:///docker.sock \
        -v $(pwd):/makisu-context \
        -v /tmp/makisu-storage:/makisu-storage \
        gcr.io/makisu-project/makisu:$makisu_version build \
            --commit=explicit \
            --modifyfs=true \
            --load \
            ${@:1:${#@}-1} /makisu-context
    cd -
}

# https://starship.rs/advanced-config/#change-window-title
function starship_set_win_title(){
    echo -ne "\033]0; $PWD \007"
}

starship_precmd_user_func="starship_set_win_title"
eval "$(starship init bash)"

[ -s "/usr/share/scm_breeze/scm_breeze.sh" ] && source "/usr/share/scm_breeze/scm_breeze.sh"
