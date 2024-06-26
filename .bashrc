# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

__aws_ps1() {
  if [ -n "$AWS_PROFILE" ]; then
    printf "\033[1;33m󰸏 "
    readonly profile
    if [[ $AWS_PROFILE = Development* ]]; then
      printf "dev"
    elif [[ $AWS_PROFILE = Production* ]]; then
        printf "prod"
    else
        printf "mgmt"
    fi
    printf "\033[0m"
  fi
}

__my_prompt() {
    aws_ps1=$(__aws_ps1)
    git_ps1=$(__git_ps1 " \033[0;31m %s\033[0m")
    show_my_prompt=false

    if [ -n "$aws_ps1" ] || [ -n "$git_ps1" ]; then
        show_my_prompt=true
    fi

    if [ "$show_my_prompt" = true ]; then
        printf "$aws_ps1$git_ps1 "
    fi
}

work_tmux () {
    tmux new-session -s work -n infra -c ~/workspace/Backend/captain-infra \; \
        send-keys 'vi .' C-m \; \
        split-window -v -p 25 -c ~/workspace/Backend/captain-infra \; \
        send-keys 'mgmt && . ./helpers/env.sh && clear' C-m \; \
        new-window -n dotfiles -c ~/workspace/dotfiles \; \
        send-keys 'vi .' C-m \; \
        new-window -n agent -c ~/workspace/Backend/captain-agent \; \
        send-keys 'source $(poetry env info --path)/bin/activate && vi .' C-m \; \
        split-window -v -p 25 -c ~/workspace/Backend/captain-agent \; \
        send-keys 'source $(poetry env info --path)/bin/activate && clear' C-m \; \
        new-window -n ci -c ~/workspace/Backend/captain-ci \; \
        send-keys 'vi .' C-m \; \
        split-window -v -p 25 -c ~/workspace/Backend/captain-ci \; \
        new-window -n serverless -c ~/workspace/Backend/captain-serverless \; \
        send-keys 'vi .' C-m \; \
        split-window -v -p 25 -c ~/workspace/Backend/captain-serverless \; \
        new-window -n notes -c ~/Documents/Notes \; \
        send-keys 'vi .' C-m \; 
}

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
    PS1='${debian_chroot:+($debian_chroot)}$(__my_prompt)\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

PROMPT_DIRTRIM=3

# ENV vars
export PNPM_HOME="$HOME/.local/share/pnpm"
export NX_NO_CLOUD=true
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"

# PATH modification
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PNPM_HOME:$PATH"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

