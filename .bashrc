alias xclip='xclip -selection c'
alias sl=ls
# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
#metasploit, my own scripts, texlive
export PATH=$PATH:/opt/framework-3.5.2/app/:/sbin:/home/nemo/projects/scripts/:/home/nemo/projects/ubuntu_packages/android-sdk-linux/tools:/opt/vagrant/bin
# append to the history file, don't overwrite it
. ~/.nvm/nvm.sh #node version manager
# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000
alias llama='ssh git@git.sdslabs.co.in llama'
alias sublime='~/apps/sublime/sublime_text'
alias chrome='chromium-browser'
alias putio="echo -n \"captn3m0:A0CH5tEjSJ6zbisB\" |base64|xargs -I \"$$\" axel -n 10 -a --header \"Authorization: Basic $$\""
alias gittunnel='ssh mobile@10.42.43.2 -L 2000:github.com:22 -N'
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
export TERM=xterm-256color
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
if [[ -f /etc/bash_completion ]] && ! shopt -oq posix; then
    . /etc/bash_completion
fi
function sympathy() { chromium-browser "chrome-extension://ilcgkjlgdddhjpbchiikkainlfiamkog/main.html#`pwd`/$1" ;}
function smallmkv() { ffmpeg -i "$1" -b 1000k -acodec libmp3lame -vcodec libx264 -ar 44100 -ab 56k -ac 2 -vpre fast -crf 24 \ "$1.mkv" ;}
#export LC_ALL=en_US
#export LANG=en_US
export LC_ALL="C" ##For the weird characters in man pages

#Ruby version manager
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
rvm default #Use the default ruby

#My latest prompt

function _update_ps1() {
  export PS1="$(~/projects/ubuntu_packages/powerline-shell/powerline-shell.py --mode compatible $? 2> /dev/null)"
}

export PROMPT_COMMAND="_update_ps1"
###b-egin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

# autoload -U compinit
# compinit
export BLOCKSIZE=K
# export CDPATH=.:~:~/src:/etc
# export DISPLAY=:79
#export EDITOR="gedit -w --resume" Typing 'fc'	# open last command for editing in gedit, then execute on save
export EDITOR='vim'
# export ftp_proxy=${MY_PROXY}
# export GPG_TTY='tty'				# gpg-agent says it needs this
export GREP_OPTIONS='-D skip --binary-files=without-match --ignore-case'		# most commonly used grep options
export HISTCONTROL=ignoreboth:erasedups		# for 'ignoreboth': ignore duplicates and /^\s/
#export HISTCONTROL=ignoreboth			# ignore spaced commands and prevents storing of duplicate commands (ie, ignoredups & ignorespace)
#export HISTCONTROL=ignoredups			# don't put duplicate lines in the history. See bash(1) for more options
#export HISTCONTROL=ignorespace		# will make sure that bash don’t store any command beginning with the space character
# export HISTFILE='$HOME/.history'
# export HISTFILESIZE=10000			# increase or decrease the size of the history to '10,000'
# export HISTFILESIZE=${HISTSIZE}		# bash will remember 'N' commands
#export HISTIGNORE='&:bg:fg:ll:h'
#export HISTIGNORE='${HISTIGNORE:+$HISTIGNORE:}la:ll:lah:lat:;a:-:fg:bg:j:sync:esu:rma:rmp:fol:pfol'
export HISTIGNORE="&:ls:[bf]g:exit"		# duplicate entries in bash history, as well as ls, bg, fg & exit, making for cleaner bash history
#export HISTIGNORE="&:ls:ll:la:l.:pwd:exit:clear"
#export HISTIGNORE='pwd:cd:ls:ls -l:'		# ignore commands given
#export HISTSIZE=10000				# increase or decrease the size of the history to '10,000'
# export HISTTIMEFORMAT='| %d/%m/%y %T | '	# make 'History' Show The Date For Each Command
# export HISTTIMEFORMAT='%F %T '		# adds date and time to history
#export HISTTIMEFORMAT='%H:%M > '
# export HISTTIMEFORMAT='%s' 			# the beloved Second of Our Linux
# export HISTTIMEFORMAT='%Y-%b-%d::%Hh:%Mm:%Ss '
#export HISTTIMEFORMAT='%Y-%m-%d_%H:%M:%S_%a  '	# makes history display in YYYY-MM-DD_HH:MM:SS_3CharWeekdaySpaceSpace format
export HOSTFILE=$HOME/.hosts    		# put list of remote hosts in ~/.hosts ...
# export http_proxy=${MY_PROXY}
# export https_proxy=${MY_PROXY}
# export IGNOREEOF=1				# prevent CTRL-D from immediately logging out
# export INPUTRC=/etc/inputrc			# it's possible that this will make bash find my delete key (and everything else)((but i don't think it did))
# export INPUTRC=$HOME/.inputrc			# type in ‘whatever’ and press ‘Page Up’ key and bash automatically fetches last command that starts with whatever and completes the command for you (requires '$HOME/.inputrc' with these lines: #Page up/page down && "\e[5~": history-search-backward && "\e[6~": history-search-forward)
# export LC_COLLATE="en_CA.utf8"		# change sorting methods [a-Z] instead of [A-Z]
export LESSCHARSET='latin1'
export LESS='-i -N -w  -z-4 -g -e -M -X -F -R -P%t?f%f \'
# export LESSOPEN="|lesspipe.sh %s"; export LESSOPEN
export LESSOPEN='|/usr/bin/lesspipe.sh %s 2>&-'	# use this if lesspipe.sh exists
# export LESS="-QR"				# tell less not to beep and also display colours
# export LESS='-R'
# export LESS_TERMCAP_mb=$'\E[01;31m'      	# less colors for Man pages # begin blinking
# export LESS_TERMCAP_md=$'\E[01;38;5;74m'  	# less colors for Man pages # begin bold
# export LESS_TERMCAP_me=$'\E[0m'           	# less colors for Man pages # end mode
# export LESS_TERMCAP_se=$'\E[0m'           	# less colors for Man pages # end standout-mode
# export LESS_TERMCAP_so=$'\E[38;5;246m'    	# less colors for Man pages # begin standout-mode - info box
# export LESS_TERMCAP_ue=$'\E[0m'           	# less colors for Man pages # end underline
# export LESS_TERMCAP_us=$'\E[04;38;5;146m' 	# less colors for Man pages # begin underline
# export MY_PROXY='http://YOUR_USERNAME:YOUR_PASSWORD@PROXY_IP:PROXY_PORT/'
# export OOO_FORCE_DESKTOP=gnome   		# openoffice preferences
export PAGER='less -e'
# export PATH=$PATH:$HOME/scripts
# export PILOTRATE=57600			# make pilot-xfer go faster than 9600
export TERM='xterm'
export TIMEFORMAT=$'\nreal %3R\tuser %3U\tsys %3S\tpcpu %P\n'
# export USER_CLIENT=deluge
# export USER_DPRT=22218
# export USER_OPRT=47426
# export USER_VPRT=79
# export USER_WPRT=30818
#export VISUAL='nano'
# export wpsetters=feh
# ${file%\.[^.]*}				# to remove filename extensions in bash
# fortune -a					# fortunes at each new shell
# mesg n              				#
set -b						# causes output from background processes to be output right away, not on wait for next primary prompt
# set bell-style visible			# I hate noise
set completion-ignore-case on 		# complete things that have been typed in the wrong case
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
# shopt -s dotglob				# files beginning with . to be returned in the results of path-name expansion
# shopt -s expand aliases			# expand aliases
shopt -s extglob				# necessary for bash completion (programmable completion)
# shopt -s globstar				# enables the ** globbing operator
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
# shopt -u force_fignore			# expand to complete an ignored word, if no other words match.
# shopt -u mailwarn
# shopt -u sourcepath
# stty -ixon					# disable XON/XOFF flow control (^s/^q)
stty start undef
stty stop undef
# stty stop ''					# use C-s to search forward through history (do not block output)
# ulimit -c unlimited				# let me have core dumps
ulimit -S -c 0          			# (core file size) don't want any coredumps
# ulimit -S -f 1024   				# open files
# ulimit -S -s 8192  				# stack size
# ulimit -S -u 256    				# max user processes
# umask 007    					# all files created 660, dirs 770
# umask 022					# makes new files have permissions: rwxr-xr-x
# umask 077           				# after everything is installed, uncomment this and the mkdir alias below ((base 8) 777 & ~077 = 700 = u=rwx,g=,o=)
# unset HISTFILESIZE				# infinite History
# unset HISTSIZE				# infinite History
#unset MAILCHECK        				# don't want my shell to warn me of incoming mail
# unsetopt bgnice            			# don't nice bg command


##################################################
# To create a ZIP archive of a file or folder	 #
##################################################

function zipf() { zip -r "$1".zip "$1" ; }



### Custom Functions For adding and fetching covers from a pdf ###
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

#### FASD
eval "$(fasd --init auto)"
alias a='fasd -a'        # any
alias s='fasd -si'       # show / search / select
alias d='fasd -d'        # directory
alias f='fasd -f'        # file
alias sd='fasd -sid'     # interactive directory selection
alias sf='fasd -sif'     # interactive file selection
alias z='fasd_cd -d'     # cd, same functionality as j in autojump
alias zz='fasd_cd -d -i' # cd with interactive selection


### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
eval `keychain --eval --agents ssh id_rsa`

#SCM Breeze

[ -s "/home/nemo/.scm_breeze/scm_breeze.sh" ] && source "/home/nemo/.scm_breeze/scm_breeze.sh"

#UTF-8 Alias
export LC_ALL=en_US.UTF-8
