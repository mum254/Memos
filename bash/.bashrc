# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

#export BSTINPUTS=$BSTINPUTS:/usr/share/texmf/jbibtex/bst
#export BSTINPUTS=$BSTINPUTS:/usr/share/texmf/jbibtex/bst
export BIBINPUTS=$BIBINPUTS:/usr/share/texmf/jbibtex/bib:~/research/paper/bibtexDB:~/Dropbox/Documents/03_Research/References/BibtexDB
export BSTINPUTS=$BSTINPUTS:/usr/share/texmf/jbibtex/bst

#if [ -e /opt/hackathon/ros/indigo/setup.bash ] ; then
#  export TARGET_IP=$(LANG=C /sbin/ifconfig eth3 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*')
#  if [ -z "$TARGET_IP" ] ; then
#    echo "Ethernet connection not detected."
#  else
#    export ROS_IP=$TARGET_IP
#  fi
#  export ROS_HOME=~/.ros
#  alias sim_mode='export ROS_MASTER_URI=http://localhost:11311 export PS1="\[\033[44;1;37m\]<local>\[\033[0m\]\w$ "'
#  alias hsrb_mode='export ROS_MASTER_URI=http://hsrb:11311 export PS1="\[\033[41;1;37m\]<hsrb>\[\033[0m\]\w$ "'
#  alias hsrb8_mode='export ROS_MASTER_URI=http://hsrb8:11311 export PS1="\[\033[41;1;37m\]<hsrb>\[\033[0m\]\w$ "'
#  alias hsrb6_mode='export ROS_MASTER_URI=http://hsrb6:11311 export PS1="\[\033[41;1;37m\]<hsrb>\[\033[0m\]\w$ "'
#  alias hsrb7_mode='export ROS_MASTER_URI=http://hsrb7:11311 export PS1="\[\033[41;1;37m\]<hsrb>\[\033[0m\]\w$ "'
#  source /opt/hackathon/ros/indigo/setup.bash
#fi
#source /opt/ros/indigo/setup.bash
#source ~/Documents/dev/ros/tc2015_ws/devel/setup.bash
source ~/Documents/dev/ros/gazebo_ros/devel/setup.bash
#source /home/morita/Documents/dev/ros/ros_by_example_ws/devel/setup.bash
#source /home/morita/Documents/dev/ros/ros_by_example_ori_ws/devel/setup.bash
source ~/tools/gitflow/contrib/completion/git-flow-completion.bash
#export ROS_PACKAGE_PATH="~/catin_ws/src:$ROS_PACKAGE_PATH"

PATH="$PATH:~/tools/qtcreator-3.4.2/bin:~/tools/smartgit/bin"
export QT_IM_MODULE=ibus;

# view on bash
PS1="\[\033[1;32m\]\$(date +%Y/%m/%d_%H:%M:%S)\[\033[0m\] \[\033[33m\]\H:\w\n\[\033[0m\][\u@ \W]\[\033[36m\]\$(__git_ps1)\[\033[00m\]\$ "

#
# git-completion.bash / git-prompt.sh
#
if [ -f /path/to/git-completion.bash ]; then
    source /home/morita/documents/scripts/git/git-completion.bash
fi
if [ -f /path/to/git-prompt.sh ]; then
    source /home/morita/documents/scripts/git/git-prompt.sh
fi
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUNTRACKEDFILES=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWUPSTREAM=auto