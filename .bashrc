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
alias gittunnel='ssh mobile@10.42.43.2 -L 2000:github.com:22 -N'
#autojump
[[ -s ~/.autojump/etc/profile.d/autojump.bash ]] && source ~/.autojump/etc/profile.d/autojump.bash
# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac
force_color_prompt=yes

	color_prompt=yes


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
PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`pwd`\007";'

###-begin-npm-completion-###
#
# npm command completion script
#
# Installation: npm completion >> ~/.bashrc  (or ~/.zshrc)
# Or, maybe: npm completion > /usr/local/etc/bash_completion.d/npm
#

COMP_WORDBREAKS=${COMP_WORDBREAKS/=/}
COMP_WORDBREAKS=${COMP_WORDBREAKS/@/}
export COMP_WORDBREAKS

#SCM Breeze, used for ga,gs,gc etc
[[ -s "$HOME/.scm_breeze/scm_breeze.sh" ]] && . "$HOME/.scm_breeze/scm_breeze.sh"


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

alias greph='history | grep $1'


##################################################
# Aptitude stuff				 #
##################################################

alias install='apt-fast install'
alias update='apt-fast update'
alias upgrade='apt-fast upgrade'


##################################################
# Command substitution				 #
##################################################

alias abs='sudo abs'
alias a='ssh-agent;ssh-add'
#alias bt='aria2c --max-upload-limit=10K --seed-time=60 --listen-port=8900-8909'		# shortcut for downloading a torrent file on the command line
alias c='clear'
#alias ci='vim'
#alias ck='killall conky && conky -d'
alias cls='clear'
alias contents='/bin/tar -tzf'								# can View the contents of a Tar file
alias cp='cp -iv'
alias dr='dirs -v'
alias ds_='dig +noauthority +noadditional +noqr +nostats +noidentify +nocmd +noquestion +nocomments'		# short and sweet output from dig(1)
alias e='espeak'
alias fgrep='fgrep –color=auto'
alias ge='geany'
alias go='startx'
alias grep='grep --color=auto'								# highlight matched pattern
alias g_='mocp -G'
alias halt='sudo /sbin/halt'
alias h='history | grep $1'
alias hib='sudo pm-hibernate'
alias ie='wine iexplore.exe'								# browse the Internet using Internet Explorer
alias im='centerim'  									# terminal based instant messaging client
alias img='imgurbash' 									# uploads image to imgur
alias irc='irssi' 									# terminal based IRC
# alias irssi='screen -wipe; screen -A -U -x -R -S irssi irssi'				# for creating screen session containing IRSSI, named irssi, while checking if existing session is created
alias k='kill'
alias kn='killall nautilus'
alias last='last -a'
alias lock='clear && vlock -c'								# clear and lock console (non-X) terminal
alias logs='tail -f /var/log/messages /var/log/*log'
alias m='~/bin/motd.pl'
#alias me='vi ~/.muttrc'
alias mkdir='mkdir -p -v'
alias mktd='tdir=`mktemp -d` && cd $tdir'						# make a temp dir, then immediately cd into it
alias m=mutt
alias more='less'
alias mp='screen -d -m mousepad'
alias mv='mv -iv'
alias na='nano'
alias nmr='sudo /etc/rc.d/networkmanager restart'
alias n='nautilus & exit'
alias np='mpc --format "np: [[%artist%] - [%title%] - 					#[[%album%] ##[%track%]#]]|[%file%]" | head -n 1'
alias nq='nautilus -q'
alias oe='wine msimn.exe'								# read email with Outlook Express
alias packup='/bin/tar -czvf'								# compress a file in tar format
alias parts='cat /proc/partitions'
# alias paste='ix'  									# pastes to ix.ox pastebin service
alias paste='pastebinit'
alias path='echo -e ${PATH//:/\\n}'
alias pe='vi ~/.procmailrc'
alias pg='ps aux | grep'*								# requires an argument
alias pi='`cat ~/.pi | grep ' ; alias addpi='echo "cd `pwd`" >> ~/.pi'			# fast access to any of your favorite directory.
alias ping='ping -c 10'
alias pjet='enscript -h -G -fCourier9 -d $LPDEST'           				# pretty-print using enscript
alias print='/usr/bin/lp -o nobanner -d $LPDEST'            				# assumes LPDEST is defined (default printer)
alias ps='ps auxf'
alias p_='for ((n=0;n<1;n++)); do dd if=/dev/urandom count=1 2> /dev/null | uuencode -m -| sed -ne 2p | cut -c-8; done' # creating password
alias :q='exit'
alias q='exit'
alias rcci='svn ci ~/rc/'
alias rcup='~/bin/rc_sync.sh'
alias rd='cd "`pwd -P`"' 								# if in directory containing symlink in path, change to "real" path
alias real_location='readlink -f' 							# get real location of file
alias reboot='sudo /sbin/reboot'
alias reboot='sudo shutdown -r now'   						# easy shutdown management
alias refresh='nautilus -q && gconftool-2 --shutdown && rm -rf /home/$HOME/.gconf/apps/panel && pkill gnome-panel'	# safely close/refresh nautilus and gnome-panel
alias rgrep='find . \( ! -name .svn -o -prune \) -type f -print0 | xargs -0 grep'	# rgrep: recursive grep without .svn
alias rh='rehash'
alias rmdir='rmdir -v'
alias rm='rm -iv'
#alias root='sudo bash -l'								# generic shortcut for switching to root user depending on system
alias root='sudo -i'									# generic shortcut for switching to root user depending on system
#alias root='su -'									# generic shortcut for switching to root user depending on system
alias scx='screen -x'
alias sdi='sudo dpkg -i'
alias se='vi ~/.screenrc'
alias sg='sudo geany'
alias shutdown='sudo shutdown -h now'							# proper restart
alias shutdownde='for ((;;)) do pgrep wget ||shutdown -h now; sleep 5; done'		# if download end, shutdown
alias sn='sudo nano'
alias split='split -d'
alias sql='mysql -p -u root'
alias sr='screen -d -RR'
#alias s='sudo'
#alias s_='screen -X screen'; s top; s vi; s man ls;					# start a new command in a new screen window
alias sshdo='ssh -q -t root@localhost -- cd $PWD \&\& sudo'				# an alternative to sudo
alias sus='sudo pm-suspend'
alias svi='sudo vim'
alias tc='tar cfvz'
alias te='tail -50f /var/log/qmail/qmail-send/current | elog'
alias tf='tail -50f /var/log/iptables.log'
alias tm='tail -50f /var/log/messages.log'
alias ts='tail -50f /var/log/auth.log'
alias tweet='bti'
alias tx='tar xfvz'
alias u='mocp -P && sudo pm-suspend ; sleep 1s && mocp -U && setxkbmap -option terminate:ctrl_alt_bksp && xmodmap .config/caps-esc && ~/.fehbg'	# something is messed up somewhere, dirty fix
alias unpack='/bin/tar -xzvpf'								# uncompress a a Tar file
alias updatefont='fc-cache -v -f'
alias url='tinyurl'
alias urlping="ping -q -c 1 www.google.com|awk -F/ 'END{print $5}'"			# do one ping to URL: good in MRTG gauge graph to monitor connectivity
alias v='zless -N'									# -N means display line numbers (turn off line numbers with -n)
alias ve='vi ~/.vimrc'
alias vi='vim'
alias web='w3m'   									# terminal based web browser
alias which='type -all'
alias win='/media/win'
alias wtf='watch -n 1 w -hs'
alias xee='cat /var/log/Xorg.0.log |grep EE'
alias xevs="xev | grep 'keycode\|button'"						# only show button events for xev
alias xp='xprop | grep "WM_WINDOW_ROLE\|WM_CLASS" && echo "WM_CLASS(STRING) = \"NAME\", \"CLASS\""'
alias x='startx'
alias xww='cat /var/log/Xorg.0.log |grep WW'
alias yt='youtube-dl -t '
alias z='zenity --info --text="You will not believe it, but your command has finished now! :-)" --display :0.0'	# get a desktop notification from the terminal
alias zen='fortune /usr/share/fortune/zen'


##################################################
# Computer cleanup				 #
##################################################

alias cleanup='sudo apt-get -y autoclean && sudo apt-get -y autoremove && sudo apt-get -y clean && sudo apt-get -y remove && sudo deborphan | xargs sudo apt-get -y remove --purge'
#alias configpurge="sudo aptitude purge `dpkg --get-selections | grep deinstall | awk '{print $1}'`"	# purge configuration files of removed packages on debian systems
#alias kernelcleanup="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge"										# remove all unused Linux Kernel headers, images & modules
#alias orphaned='sudo deborphan | xargs sudo apt-get -y remove --purge'
#alias tp='trash-put'											# sends files to trash instead of perm deleting w/rm
alias trash='rm -fr ~/.Trash'


##################################################
# Directory shortcuts				 #
##################################################

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

##################################################
# Git stuff					 #
##################################################

alias gitouch='find . \( -type d -empty \) -and \( -not -regex ./\.git.* \) -exec touch {}/.gitignore \;'
alias gitup='git pull'
alias gitci='git commit -a -m'
alias gitco='git clone'


##################################################
# Hardware Shortcuts				 #
##################################################

alias 0='amixer set PCM 0'
alias -- -='amixer set PCM 2-'
alias +='amixer set PCM 2+'
alias blankcd='cdrecord -v dev=/dev/cdrom blank=fast gracetime=3'
alias blankdvd='cdrecord -v dev=/dev/dvd blank=fast gracetime=3'
alias blueoff='sudo /etc/rc.d/bluetooth stop'
alias blueon='sudo /etc/rc.d/bluetooth start'
alias blueres='sudo /etc/rc.d/bluetooth restart'
alias brand='growisofs -Z /dev/cdrw -v -l -R -J -joliet-long'
alias burnaudiocd='mkdir ./temp && for i in *.[Mm][Pp]3;do mpg123 -w "./temp/${i%%.*}.wav" "$i";done;cdrecord -pad ./temp/* && rm -r ./temp'	# burn a directory of mp3s to an audio cd
alias cdc='eject -t /dev/cdrecorder'
alias cdo='eject /dev/cdrecorder'
alias cruzer='mount /media/cruzer'
alias dvdc='eject -t /dev/dvd'
alias dvdo='eject /dev/dvd'
alias dvdrip='vobcopy -i /dev/dvd/ -o ~/DVDs/ -l'
alias dvdrip_='mplayer dvd://1 -dumpstream -alang es -dumpfile "$HOME/$DVD".mpg && ffmpeg -i "$HOME/$DVD".mpg -acodec libmp3lame -alang spa -vcodec libx264 -crf 26 -vpre hq -threads 0 "$HOME/$DVD.mp4"'
#alias ipod='mount /media/ipod && cd /media/ipod'
alias laptop_display='sudo cat /proc/acpi/video/VGA/LCD/brightness'		# set laptop display brightness	(path may vary depending on laptop model
alias laptop_displays='echo <percentage> > /proc/acpi/video/VGA/LCD/brightness'	# to discover the possible values for your display
alias mountcd='sudo mount -t is09660 /dev/sr0 /media/cdrom'
alias mountedinfo='df -hT'
alias mountiso='sudo mount ${1} ${2} -t iso9660 -o ro,loop=/dev/loop0'
alias mountwin='mount -t ntfs /dev/sda1 /media/win'
alias mp3='mount /media/mp3 && cd /media/mp3'
alias playm='for i in *.mp3; do play $i; done'
alias playo='for i in *.ogg; do play $i; done'
alias playw='for i in *.wav; do play $i; done'
alias scan='scanimage -L'
alias sd='mount /media/sd'
alias ucruzer='umount /media/cruzer'
alias uipod='umount /media/ipod'
alias ukingston='umount /media/kingston'
alias umountiso='sudo umount /media/iso'
alias ump3='umount /media/mp3'
alias usd='umount /media/sd'
alias uverbatim='umount /media/verbatim'
alias verbatim='mount /media/verbatim && cd /media/verbatim'



##################################################
# Information					 #
##################################################

alias biggest='BLOCKSIZE=1048576; du -x | sort -nr | head -10'				# show biggest directories
alias boothistory='for wtmp in `dir -t /var/log/wtmp*`; do last reboot -f $wtmp; done | less'
alias charcount='wc -c $1'								# count number of characters in text file
alias cpu_hogs='ps wwaxr -o pid,stat,%cpu,time,command | head -10'			# to find CPU hogs
alias cputemp='while sleep 1; do acpi -t | osd_cat -p bottom; done &'			# to get the CPU temperature continuously on the desktop
alias df='df -h -x tmpfs -x usbfs'							# displays global disk usage by partition, excluding supermounted devices
alias directorydiskusage='du -s -k -c * | sort -rn'
alias dir='ls --color=auto --format=vertical'
alias diskwho='sudo iotop'
alias dmidecode='sudo dmidecode --type 17 | more'					# check RAM sed and type in Linux
alias ducks='ls -A | grep -v -e '\''^\.\.$'\'' |xargs -i du -ks {} |sort -rn |head -16 | awk '\''{print $2}'\'' | xargs -i du -hs {}'	# useful alias to browse your filesystem for heavy usage quickly						# to show processes reading/writing to disk
alias du='du -h --max-depth=1'								# displays disk usage by directory, in human readable format
alias dush='du -sm *|sort -n|tail'							# easily find megabyte eating files or directories
alias env2='for _a in {A..Z} {a..z};do _z=\${!${_a}*};for _i in `eval echo "${_z}"`;do echo -e "$_i: ${!_i}";done;done|cat -Tsv'	# print all environment variables, including hidden ones
alias exportkeys='sudo apt-key exportall > repokeys.txt'				# exports all repo keys info into single 'repokeys.txt' document
alias exportkey='sudo apt-key export'							# show single repo key info using keyid found in 'sudo apt-key list'
alias ffind='sudo find / -name $1'
alias free='free -m'									# RAM and SWAP detail in MBs
alias freqwatch='watch --interval 1 "cat /proc/acpi/thermal_zone/THRM/*; cat /proc/cpuinfo | grep MHz; cat /proc/acpi/processor/*/throttling"'  # monitor cpu freq and temperature
alias hardware='sudo lshw -html > hardware.html'					# overview of the hardware in the computer
# alias hgrep='history | grep --color=always'						# search commands history
alias hiddenpnps='unhide (proc|sys|brute)'						# forensic tool to find hidden processes and ports
alias hogc='ps -e -o %cpu,pid,ppid,user,cmd | sort -nr | head'				# display the processes that are using the most CPU time and memory
alias hogm='ps -e -o %mem,pid,ppid,user,cmd | sort -nr | head'				# display the processes that are using the most CPU time and memory
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
alias mem_hogs_ps='ps wwaxm -o pid,stat,vsize,rss,time,command | head -10'		# to find memory hogs
alias mem_hogs_top='top -l 1 -o rsize -n 10'						# to find memory hogs
alias mem='~/.scripts/realmem'								# estimates memory usage
alias mypc="hal-get-property --udi /org/freedesktop/Hal/devices/computer --key 'system.hardware.product'"		# show computer model
alias myps='/bin/ps -u "$USER" -o user,pid,ppid,pcpu,pmem,args|less'			# ps
alias numFiles='echo $(ls -1 | wc -l)'							# numFiles: number of (non-hidden) files in current directory
alias packagelist="sudo aptitude search -F %p ~i --disable-columns"			# show list of all packages (columns)
alias packagelist_="sudo aptitude search -F %p ~i --disable-columns | sed 's/$/,/' | tr '\n\r' ' ' | sed 's/, $//'"	# list all packages (1-liner)
alias phonesearch='grep '[0-9]\{3\}-[0-9]\{4\}' "$1"'					# search phone #'s in file (requires XXX-XXX-XXXX format)
alias processbycpuusage="ps -e -o pcpu,cpu,nice,state,cputime,args --sort pcpu | sed '/^ 0.0 /d'"
alias processbymemusage='ps -e -o rss=,args= | sort -b -k1,1n | pr -TW$COLUMNS'
alias processtree='ps -e -o pid,args --forest'
alias pss='ps -ef | grep $1'								# to check a process is running in a box with a heavy load: pss
alias rcommand='ls /usr/bin | shuf -n 1'						# get a random command
# alias rcommand='man $(ls /usr/bin | shuf -n 1)'					# get a random command
alias sete='set|sed -n "/^`declare -F|sed -n "s/^declare -f \(.*\)/\1 ()/p;q"`/q;p"'	# display environment vars only, using set
alias showallaliases='compgen -A alias'							# list bash alias defined in .bash_profile or .bashrc
alias showallfunctions='compgen -A function'						# list bash functions defined in .bash_profile or .bashrc
alias showkeys='sudo apt-key list'							# shows list of repository keys
alias sizeof='du -sh'
alias space='df -h'									# disk space usage
alias sshall='logwatch --service sshd --range all --detail high --print --archives'
alias sshtoday='logwatch --service sshd --range today --detail high --print --archives'
alias superfind='sudo find / ! \( -path /proc -prune -o -path /tmp -prune -o -path /dev -prune -o -path /mnt -prune \) -name'
alias top-commands='history | awk "{print $2}" | awk "BEGIN {FS="|"} {print $1}" |sort|uniq -c | sort -rn | head -10'	# show most popular commands
alias topforever='top -l 0 -s 10 -o cpu -n 15'						# continual 'top' listing (every 10 sec) showing top 15 CPU things
alias topten='du -sk $(/bin/ls -A) | sort -rn | head -10'				# displays the top ten biggest folders/files in the current directory
alias top20='du -xk | sort -n | tail -20'						# find the 20 biggest directories on the current filesystem
alias top_='xtitle Processes on $HOST && top'						# uses the function 'xtitle'
alias treefind_="find . | sed 's/[^/]*\//|   /g;s/| *\([^| ]\)/+--- \1/'"		# displays a tree of the arborescence
alias tree='tree -Cs'									# nice alternative to 'ls'
alias unusedkernels="dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d'"											# show installed but unused linux headers, image, or modules
alias vdir='ls --color=auto --format=long'
alias ver='cat /etc/lsb-release'							# Ubuntu version detail
alias version='sudo apt-show-versions'							# show version
alias whichall='{ command alias; command declare -f; } | command which --read-functions --read-alias -a'		# which alias
alias WHOAMI='getent passwd $(whoami) | cut -f 5 -d: | cut -f 1 -d,'			# prints out what the users name, notifyed in the gecos field is
alias wordcount='wc -w $1'								# count number of words in text file


##################################################
# Miscellaneous					 #
##################################################

alias -- --='-;-'
alias -- ---='-;-;-'
alias -- ----='-;-;-;-'
alias -- -----='-;-;-;-;-'
alias ++='+;+'
alias +++='+;+;+'
alias ++++='+;+;+;+'
alias +++++='+;+;+;+;+'
alias addkey='sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys'
alias addrepo='sudo add-apt-repository'							# add a repo to repo .list
alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'	# notified when job run in terminal is done using NotifyOSD
alias alert='notify-send -i gnome-terminal "Finished Terminal Job" "[$?] $(alert_helper)"'	# usage: sleep 5; alert
alias alph='cat "$1" | sort > "$1"'							# alphabetizes a file
alias alsamixer='alsamixer -V all'
alias bashrc-copy-r='sudo cp /root/.bashrc ~/.bashrc'
alias bashrc-copy='sudo cp ~/.bashrc /root/.bashrc'
alias bashrc-cpr='sudo cp ~/.bashrc /root/.bashrc && cp ~/.bashrc ~/Temp && gedit ~/.bashrc && exit'
alias bashrc='gedit ~/.bashrc & exit'
alias bashrc-root='sudo gedit ~/.bashrc & exit'
alias bashrc-temp='cp ~/.bashrc ~/Temp'
alias bbc='lynx -term=vt100 http://news.bbc.co.uk/text_only.stm'
alias bedit='vim ~/.bashrc; source ~/.bashrc'
alias beep='echo -en "\007"'								# ring the bell
alias bgedit='gedit ~/.bashrc; source ~/.bashrc'
alias capture='IMAGE="$HOME/Pictures/capture-`date +%Y%m%d%H%M%S`.png"; import -frame $IMAGE; echo "Image saved as $IMAGE"'	# save portion of desktop as image
alias cic='set completion-ignore-case On'						# make tab-completion case-insensitive
alias clisp='clisp -q'
alias color1='sh ~/.scripts/termcolor1'   						# displays colorset 1
alias color2='sh ~/.scripts/termcolor2'   						# displays colerset 2
alias color3='sh ~/.scripts/termcolor3'   						# displays colorset 3
alias commentremove="sed 's/[[:blank:]]*#.*//; /^$/d' "$1""				# this will remove comments that are at the end of lines
alias counts=sort | uniq -c | sort -nr							# a nice command for summarising repeated information
alias cut80='/usr/bin/cut -c 1-80'							# truncate lines longer than 80 characters (for use in pipes)
alias debrepack='sudo dpkg-repack'							# just an easier-to-remember alias for 'dpkg-repack'
alias differ='sdiff --suppress-common-lines'						# bash alias for sdiff: differ
alias dmregister='lynx http://desmoinesregister.com'
alias dos2unix_='perl -pi -e 's/\r\n/\n/g' *'
alias downNuncompress='wget http://URL/FILE.tar.gz -O- | tar xz'			# download a file and uncompress it while it downloads
# alias downNuncompress='curl http://URL/FILE.tar.gz | tar xz'				# download a file and uncompress it while it downloads
alias du0='du --max-depth=0'
alias du1='du --max-depth=1'
alias ebrc='nano ~/.bashrc'
alias ebrcupdate='source ~/.bashrc'
alias edit='nano'
alias elog='tai64nlocal'
alias encryptall='for f in * ; do [ -f $f ] && openssl enc -aes-256-cbc -salt -in $f -out $f.enc -pass file:/tmp/password-file ; done'	# encrypt every file in current directory with 256-bit AES, retaining original
alias fixmount='sudo e2fsck -f /dev/sda1'						# repair device booting/mounting error (for /dev/sda1)
alias fixopera='rm -r ~/.opera/{mail,lock}'
alias fixres='xrandr --size 1600x1200'      						# reset resolution
alias fix_stty='stty sane'								# restore terminal settings when they get completely screwed up
alias flv2ogg='for i in $(ls *.flv); do ffmpeg2theora -v 6 --optimize $i; done'		# convert all FLV's in a directory to Ogg Theora (video)
alias flvaudio='ffmpeg -i "$1" -f mp3 -vn -acodec copy ouput.mp3'			# extract sound from flv & make mp3
alias foldpb='pbpaste | fold -s | pbcopy'						# make text in clipboard wrap so as to not exceed 80 characters
alias funkcje="grep -o '^[a-zA-Z]\{1,\}.(*)' ~/.bashrc"
alias gdbbt='gdb -q -n -ex bt -batch'							# print stack trace of a core file without needing to enter gdb interactively
alias gifted='giftd -d && giFTcurs'
alias gitk='screen -d -m gitk'
alias gmail='sh /$HOME/projects/scripts/gmail.py'
alias gsop='gmplayer http://localhost:8909 -prefer-ipv4'
alias head='head -n $((${LINES:-`tput lines 2>/dev/null||echo -n 12`} - 2))'		# alias HEAD for automatic smart output
alias hiresvideo='mplayer -framedrop -vfm ffmpeg -lavdopts lowres=1:fast:skiploopfilter=all'	# play high-res video files on a slow processor
alias image2pdf='convert -adjoin -page A4 *.jpeg multipage.pdf'				# convert images to a multi-page pdf
alias irb='irb --readline -r irb/completion -rubygems'
alias jargon='wget -m http://catb.org/~esr/jargon/html/ -nH --cut-dirs=2 -np -L -P ~/Jargon/'
alias kernbuild='make -j3 && make modules_install && ls -ld ../linux && date'		# compile kernel, install modules, display kernel vers & date
alias kfire='for i in `ps aux | grep [F]irefox `; do echo $i; kill $(($i)); done; '
# alias kfire='kill $(pidof firefox)'
# alias kfire='kill $(ps aux | awk '/firefox/ {print $2}' | tr '\n' ' ')'
alias killall='killall -u $USER -v' 							# only kill our own processes, and also be verbose about it
alias lastlog='lastlog | grep -v Never'
alias less='less -Mnw'
alias lssd='ps ax | grep -v grep | grep -i firefox | while read pid; do kill "${pid%% *}"; done'
alias lstexfont='ls {/usr/share/texmf-dist/tex/latex/psnfss/*.sty,/usr/share/texmf-dist/tex/latex/pxfonts/*.sty}'
alias lvim="vim -c \"normal '0\""							# open the last file you edited in Vim.
alias makepasswd='makepasswd -minchars 8'
alias make_='xtitle Making $(basename $PWD) ; make'					# uses the function 'xtitle'
alias mencoder-join='mencoder -forceidx -ovc copy -oac copy -o'				# just add: whatever.avi whatever.pt1.avi whatever.pt2.avi ...
alias memlimit='ulimit -v 1000000; $1'							# limit memory usage per script/program
alias mic_record='arecord -q -f cd -r 44100 -c2 -t raw | lame -S -x -h -b 128 - `date +%Y%m%d%H%M`.mp3'	# record microphone input and output to date stamped mp3 file
alias minicom='minicom -c on' 								# enable colour (sudo apt-get install minicom)
alias mkdirday='mkdir `date +%Y%m%d`_$1'						# (by Karl Voit) creates directory that starts with current day
alias mkdsp='sudo mknod /dev/dsp c 14 3 && sudo chmod 777 /dev/dsp'			# remake /dev/dsp
alias mkpkg='makepkg -csi'
alias mp3ogg='mp32ogg *.mp3 && rm *.mp3'
alias mpfb='mplayer -vo fbdev2 -fs -zoom -xy 1440'
alias mplayer_yt='mplayer -fs $(echo "http://youtube.com/get_video.php?$(curl -s "$1" | sed -n "/watch_fullscreen/s;.*\(video_id.\+\)&title.*;\1;p")")'										# stream YouTube URL directly to mplayer
alias mtrue='sudo truecrypt /media/usbdisk/$USER.tc ~/$USER'
alias n2r='sudo /etc/init.d/nginx stop && sleep 2 && sudo /etc/init.d/nginx start'
alias ncftp='xtitle ncFTP ; ncftp'							# uses the function 'xtitle'
alias nytimes='lynx -term=vt100 http://nytimes.com'
alias passwords='passwd && rm -rf ~/.gnome2/keyrings/*'					# removes keyring passwords and lets you change user password
alias ppa-purge='sudo ppa-purge'
alias pstree='/sw/bin/pstree -g 2 -w'
alias puttyreload='export TERM=putty && source ~/.bashrc'
alias quota='quota -s'  								# human readable quota!
alias recursivetouch='find . -exec touch {} \;'						# be careful with this as it can modify time stamp of files
alias repo='gksudo gedit /etc/apt/sources.list'
alias a.r='sudo service apache2 restart'
alias rkhunter='sudo rkhunter -c'
alias rmao='find . -iname a.out -exec rm {} \;'
alias rm_DS_Store_files='find . -name .DS_Store -exec rm {} \;'				# removes all .DS_Store file from the current dir and below
alias rsync-me='sudo rsync -a -v --progress --delete --modify-window=1 -s $HOME /home/rsync'
alias scpresume='rsync --partial --progress --rsh=ssh'
# alias screencast='ffmpeg -f alsa -ac 2 -i hw:0,0 -f x11grab -r 30 -s 1280x800+0+0 -i :0.0 -acodec pcm_s16le -vcodec libx264 -vpre lossless_ultrafast -threads 0 -y output.mkv'
alias screencast='ffmpeg -f x11grab -r 30 -s 1280x800 -i :0.0 $HOME/outputFile.mpg'	# record a screencast and convert it to an mpeg
alias screencast="ffmpeg -y -f alsa -ac 2 -i pulse -f x11grab -r 30 -s `xdpyinfo | grep 'dimensions:'|awk '{print $2}'` -i :0.0 -acodec pcm_s16le output.wav -an -vcodec libx264 -vpre lossless_ultrafast -threads 0 output.mp4"		# capture video of a linux desktop
alias sdiff='/usr/bin/sdiff --expand-tabs --ignore-all-space --strip-trailing-cr --width=160'	# sdiff the way it was at IBM
alias sdirs='source ~/.dirs'
alias service='sudo service'								# access a system service
alias sh_diff='diff -abBpur'
alias sh_indent='indent -nsaf -npcs -cli2 -i2 -lp -nprs -nsaw -nut -cbi2 -bli0 -bls -nbad -npsl'
alias shot!='archey && scrot -d 5 -c screen_`date +%Y-%m-%d`.png'			# is also a function of shot which does the screen for one window
alias show_='cat ~/.dirs'
alias show-colors='~/.bin/colors.sh'
alias show-info='~/.bin/info.pl'
alias show_options='shopt'								# show_options: display bash options settings
alias showrepo='cat /etc/apt/sources.list `ls /etc/apt/sources.list.d/*.list` | egrep -v "^$"'
alias sh_svnstat="svn status | awk '/^[^?]/'"
alias sourcea='source ~/.aliases.bash'							# to source this file (to make changes active after editing)
alias ssinfo='perl ~/.scripts/ssinfo.pl'
alias stopflash='for i in ~/.adobe ~/.macromedia ; do ( rm $i/ -rf ; ln -s /dev/null $i ) ; done'	# brute force way to block all LSO cookies with the non-free Flash browser plugin
# alias svnaddall='find "$PWD" -exec svn add {} 2>/dev/null \;'				# add all files recursively
alias svnaddall='svn status | grep "^\?" | awk "{print \$2}" | xargs svn add'
alias svndelall='svn status | grep "^\!" | awk "{print \$2}" | xargs svn delete'
alias svnrmallentries='find . -name .svn -print0 | xargs -0 rm -rf'			# remove all .svn directories recursively
alias tailm='multitail'
alias tarred='( ( D=`builtin pwd`; F=$(date +$HOME/`sed "s,[/ ],#,g" <<< ${D/${HOME}/}`#-%F.tgz); tar --ignore-failed-read --transform "s,^${D%/*},`date +${D%/*}.%F`,S" -czPf "$"F "$D" &>/dev/null ) & )'					# create date-based tgz of current dir (runs in background)
# alias themeinfo='perl ~/Scripts/info.pl'
alias thumbit='mogrify -resize 25%'
alias tinyurl='~/.scripts/tinyurl'							# converts url to tinyurl
alias tkeys='tmux list-keys'  								# shows all tmux keys
alias trace='~/.scripts/trace'								# visual traceroute
alias txt2md='rename 's/\.txt$/\.md$/i' *'						# batch rename extension of all .txt files to .md files in a folder
alias ugrub2='sudo update-grub2'							# update grub2
alias ugrub='sudo update-grub'								# update grub
alias updatedb='sudo updatedb'
alias updatefonts='sudo fc-cache -vf'
alias usbb='rsync -avz /media/usbdisk/ ~/backup/usb/'
alias utrue='sudo truecrypt -d'
alias webcam='mplayer -cache 128 -tv driver=v4l2:width=176:height=177 -vo xv tv:// -noborder -geometry "95%:93%" -ontop'	# mplayer webcam window for screencasts
alias webshare='python -c "import SimpleHTTPServer; SimpleHTTPServer.test();"'
#alias wiki='wikipedia2text -p'								# convert wiki to text output
alias wma2wav='for i in *.wma; do mplayer -vo null -vc dummy -af resample=44100 -ao pcm:waveheader:file="${i%.wma}.wav" "$i" ; done'	# convert wma to wav
alias xinitrc='vim ~/.xinitrc'
alias xsnow='(killall xsnow ; sleep 3 ; exec xsnow -nosanta -notrees -norudolf -nokeepsnow >& /dev/null &)'	# xsnow

##################################################
# Network/Internet -oriented stuff		 #
##################################################

alias appson="netstat -lantp | grep -i stab | awk -F/ '{print $2}' | sort | uniq"	# view only the process name using an internet connection
alias bandwidth='dd if=/dev/zero of=/dev/null bs=1M count=32768'			# processor / memory bandwidthd? in GB/s
alias browse_bonjour='dns-sd -B'							# browse services advertised via Bonjour
# alias daemons='ls /var/run/daemons'  							# daemon managment (ommited for function)
alias dbdumpcp='scp -P 1234 username@12.34.56.78:$HOME/Backup/www/data/someSite/db.sql $HOME/Backup/data/db.sql'	# copy remote db to local
alias dns='cat /etc/resolv.conf'							# view DNS numbers
#alias domain2ban='~/.scripts/Domain2Ban.sh'
alias estab='ss -p | grep STA' 								# view only established sockets (fails if "ss" is screensaver alias)
#alias finchsync='java -jar ~/finchsync/finchsync.jar'					# start FinchSync Admin
# alias ftop='watch -d -n 2 'df; ls -FlAt;''						# like top, but for files
alias hdinfo='hdparm -i[I] /dev/sda'							# hard disk information - model/serial no.
alias hostip='wget http://checkip.dyndns.org/ -O - -o /dev/null | cut -d: -f 2 | cut -d\< -f 1'
alias hostname_lookup='lookupd -d'							# interactive debugging mode for lookupd (use tab-completion)
alias http_trace='pkt_trace port 80'							# to show all HTTP packets
alias iftop='sudo iftop -i eth0' 							# start "iftop" program (sudo apt-get install iftop)
alias ip4grep="grep -E '([0-9]{1,3}\.){3}[0-9]{1,3}'"					# look for IPv4 address in files
alias ip='curl www.whatismyip.org'
alias ip_info='ipconfig getpacket en1'							# info on DHCP server, router, DNS server, etc (for en0 or en1)
alias ipt80='sudo iptstate -D 80'							# check out only iptables state of http port 80 (requires iptstate)
alias ip_trace='pkt_trace ip'								# to show all IP packets
alias ipttrans='sudo iptstate -D 51413'							# iptables state of Transmission-Daemon port (requires iptstate)
alias listen='sudo netstat -pnutl' 							# lists all listening ports together with PID of associated process
alias lsock='sudo /usr/sbin/lsof -i -P'							# to display open sockets ( -P option to lsof disables port names)
alias memrel='free && sync && echo 3 > /proc/sys/vm/drop_caches && free'		# release memory used by the Linux kernel on caches
alias net1='watch --interval=2 "sudo netstat -apn -l -A inet"'
alias net2='watch --interval=2 "sudo netstat -anp --inet --inet6"'
alias net3='sudo lsof -i'
alias net4='watch --interval=2 "sudo netstat -p -e --inet --numeric-hosts"'
alias net5='watch --interval=2 "sudo netstat -tulpan"'
alias net6='sudo netstat -tulpan'
alias net7='watch --interval=2 "sudo netstat -utapen"'
alias net8='watch --interval=2 "sudo netstat -ano -l -A inet"'
alias netapps="lsof -P -i -n | cut -f 1 -d ' '| uniq | tail -n +2"
alias nethogs='sudo nethogs eth0' 							# start "nethogs" program (sudo apt-get install nethogs)
alias netl='sudo nmap -sT -O localhost'
alias netscan='sudo iwlist wlan0 scan'							# to scan your environment for available networks, do the following
alias netstats='sudo iwspy wlan0'							# if card supports it, you can collect wireless statistics by using
alias network='sudo lshw -C network' 							# view network device info
alias networkdump='sudo tcpdump not port 22' 						# dump all the network activity except ssh stuff
alias nsl='netstat -f inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'		# show all programs connected or listening on a network port
alias ns='netstat -alnp --protocol=inet | grep -v CLOSE_WAIT | cut -c-6,21-94 | tail +2'
alias openports='sudo netstat -nape --inet' 						# view open ports
alias pkt_trace='sudo tcpflow -i `active_net_iface` -c'
alias ports='lsof -i -n -P' 								# view programs using an internet connection
alias portstats='sudo netstat -s' 							# show statistics for all ports
#alias proxy1='ssh -p 1234 -D 5678 username@12.34.56.78'					# SOCKS proxy - these anonomise browsing - 12.34.56.78
#alias proxy2='ssh -p 8765 -D 4321 username@87.65.43.21'					# SOCKS proxy - these anonomise browsing - 87.65.43.21
alias randip='echo $((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256)).$((RANDOM%256))'	# generate a random IP address
alias ramvalue='sudo dd if=/dev/mem | cat | strings'					# will show you all the string (plain text) values in ram
alias randmac='python -c "from itertools import imap; from random import randint; print ':'.join(['%02x'%x for x in imap(lambda x:randint(0,255), range(6))])"'										# generate random valid mac addresses
alias rdp='rdesktop -u sdslabs -g 1366x768 -D -r disk:home=/home -r clipboard:PRIMARYCLIPBOARD'	# quick full screen RDP connection
#alias remote='ssh -p 1234 12.34.56.78'							# access some remote host
#alias restartnet='sudo /etc/rc.d/network restart;sudo /etc/rc.d/wicd restart'
#alias rssup='php /srv/http/rssupdate.php'
#alias setessid='sudo iwconfig wlan0 essid network-essid'				# set the essid, which identifies the network access point you want
alias smtp_trace='pkt_trace port smtp'							# to show all SMTP packets
#alias someDBdump='sudo mysqldump someDB -uroot -p > $HOME/www/_dbs/someDB.sql'
alias spavr='gtkterm -c avr'
# alias spavr='sudo chmod a=rw /dev/ttyUSB0; gtkterm -c avr'
#alias spk800i='gtkterm -c k800i'
# alias spk800i='sudo chmod a=rw /dev/rfcomm0; gtkterm -c k800i'
#alias sync='java -jar ~/finchsync/finchsync.jar -nogui'					# sync to PDA .. well, that'll be a sync then! - start FinchSync SVR
#alias syncoff='java -jar ~/Apps/FinchSync/finchsync.jar -stopserver'			# sync to PDA .. well, that'll be a sync then! - stop FinchSync SVR
alias tcpstats='sudo netstat -st' 							# show statistics for tcp ports
alias tcp_='sudo netstat -atp' 								# list all TCP ports
#alias tcp_trace='pkt_trace tcp'								# to show all TCP packets
#alias topsites='curl -s -O http://s3.amazonaws.com/alexa-static/top-1m.csv.zip ; unzip -q -o top-1m.csv.zip top-1m.csv ; head -1000 top-1m.csv | cut -d, -f2 | cut -d/ -f1 > topsites.txt'							# get a list of top 1000 sites from alexa
alias tproxy='ssh -ND 8118 user@server&; export LD_PRELOAD="/usr/lib/libtsocks.so"'	# creates a proxy based on tsocks
alias udpstats='sudo netstat -su' 							# show statistics for udp ports
alias udp='sudo netstat -aup' 								# list all UDP ports
alias udp_trace='pkt_trace udp'								# to show all UDP packets
#alias uploads='cd /some/folder'								# access some folder
alias vncup='x11vnc -nopw -ncache 10 -display :0 -localhost'
alias website_dl='wget --random-wait -r -p -e robots=off -U mozilla "$1"'		# download an entire website
alias website_images='wget -r -l1 --no-parent -nH -nd -P/tmp -A".gif,.jpg" "$1"'	# download all images from a site
alias whois='whois -H'
alias wscan_='iwlist scan'								# terminal network scan for wireless signals
alias wwwmirror2='wget -k -r -l ${2} ${1}'						# wwwmirror2 usage: wwwmirror2 [level] [site_url]
alias wwwmirror='wget -ErkK -np ${1}'
