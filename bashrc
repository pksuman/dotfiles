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
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
force_color_prompt=yes

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
#function to set color by for exit_code

color_exit_code(){
				if  [ $? -eq 0 ]; then
								   echo -e "\033[01;32m"  #green
        else
									 echo -e "\033[01;31m"   #red
				fi

}
#function to set color
git_set_color(){
   UNTRACKED="$( git status --short 2> /dev/null | grep "??" | wc -l )"
   MODIFIED="$( git status --short 2> /dev/null | grep "M" | wc -l )"
   DELETED="$( git status --short 2> /dev/null | grep "D" | wc -l )"
   RENAMED="$( git status --short 2> /dev/null | grep "R" | wc -l )"
   ADDED="$( git status --short 2> /dev/null | grep "A" | wc -l )"
   if [[ "$UNTRACKED" -eq 0 && "$DELETED" -eq 0 ]]; then
           if [[ "$MODIFIED" -eq 0 && "$RENAMED" -eq 0 && "$ADDED" -eq 0 ]]; then
								   echo -e "\033[00;32m"  #green
					 else
								   echo -e "\033[00;33m"   #yellow
					 fi
	else
				 echo -e "\033[00;31m"   #red
	fi
}

# Add git branch if its present to PS1
parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}$(color_exit_code)\u\[\033[00m\]:\[\033[01;34m\]\w$(git_set_color)$(parse_git_branch)\n\[\033[0;37m\]\$\[\033[00m\]'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)} \w\a\]$PS1"
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias lh='ls -Alh' #added by Prabhat on 27 May 2016
alias l='ls -CF'
alias ln='stat -c "%a %n" *'

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

#added by Prabhat on 25 mar 2016 for libnice library
export LD_LIBRARY_PATH=/home/prabhat/local/lib
#added by Prabhat on 19 apr 2016 for bin
export PATH="/home/prabhat/local/bin:$PATH"
#for temporary use , remove once NAT testing is over
export IFNAME=enp1s0
#export IFNAME=wlp2s0

#other shortcut added by Prabhat
alias em='emacs -nw'
alias py='cd /home/prabhat/venv/bin/;source ./activate;cd ~'
alias py2='source venv2/bin/activate'
alias ipy='ipython --no-banner'
alias sub='subl'
alias pi='ssh prabhat@192.168.10.100'
alias sr='ssh prabhat@192.168.10.200'
alias ti='ssh prabhat@tigris.no-ip.org'
alias nepi='./nice_example 1 104.131.4.140'
alias neme='./nice_example 0 104.131.4.140'
alias gdbme='gdb --args ./nice_example 0 104.131.4.140'
alias gdbpi='gdb --args ./nice_example 1 104.131.4.140'
#added
alias vil='vi -u ./.vimrc'
alias gvil='gvim -u ./.vimrc'
alias bc='bc -q'
alias gdb='gdb -q -tui'
alias dh='df -h'
alias ipy='ipython --nosep'
alias jp='jupyter notebook'
alias bpy='bpython'
alias k='kill %1'
alias r='exec bash'
alias e='exit'
alias a='~/art_of_war/shell.sh'

export VISUAL=vim
export EDITOR="$VISUAL"
set -o vi  #enable vi in bash shell
alias rm="rm --preserve-root" #never rm root directory
alias c="clear" #never rm root directory

#If core happen then dump the core file
ulimit -c unlimited

absolute_command() {
    # List of commands for which history modification is allowed
    local allowed_commands=("vi" "cd" "mv" "rm")

    # Get the last command without the history number
    local last_command=$(history 1 | sed 's/^[ ]*[0-9]*[ ]*//')

    # Separate the command and its arguments
    local command_name=$(echo "$last_command" | awk '{print $1}')
    local command_args=$(echo "$last_command" | cut -d ' ' -f2-)

    # Check if the command is in the list of allowed commands
    if [[ " ${allowed_commands[@]} " =~ " ${command_name} " ]]; then
        # Convert any relative paths in arguments to absolute paths
        local expanded_args=$(echo "$command_args" | sed "s|^\./|$(pwd)/|" | sed "s|^\([^/]\)|$(pwd)/\1|g")

        # Recombine the command name with the expanded arguments
        local expanded_command="$command_name $expanded_args"

        # Clear the last command from history to avoid duplication
        history -d $(history 1 | awk '{print $1}')

        # Append the modified command to history
        history -s "$expanded_command"
    fi
}

# Set PROMPT_COMMAND to call absolute_command before each command is logged
PROMPT_COMMAND="absolute_command"
