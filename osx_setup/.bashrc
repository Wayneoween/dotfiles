# ~/.bashrc: executed by bash(1) for non-login shells.
# shellcheck disable=SC1090,SC1091

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth:erasedups

# append to the history file, don't overwrite it
shopt -s histappend

export LANG="en_US.UTF-8"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#HISTSIZE=1000
#HISTFILESIZE=2000
PROMPT_COMMAND="history -a; history -c; history -r; ${PROMPT_COMMAND}"
export HISTSIZE=
export HISTFILESIZE=
export HISTFILE=~/.bash_eternal_history
export EDITOR=vim
export PATH="$HOME/bin:$PATH"

export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_ENV_HINTS=1
# Homebrew
# /opt/homebrew/bin/brew shellenv
eval "$(/opt/homebrew/bin/brew shellenv)"
# export HOMEBREW_PREFIX="/opt/homebrew"
# export HOMEBREW_CELLAR="/opt/homebrew/Cellar"
# export HOMEBREW_REPOSITORY="/opt/homebrew"
# export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}"
# export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:"
# export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}"

export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:/Users/wayne/sbin"

export GOPATH="$HOME/code/go"
export GOBIN="$HOME/bin"

# node version manager
#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
# shellcheck disable=2034
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

export TERM=xterm256-color

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
        . /usr/local/etc/bash_completion.d/git-completion.bash
    fi
fi

# enable color support of ls and also add handy aliases
# shellcheck disable=SC2015
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# Load h.sh
if [ -f ~/.bash_highlight.sh ]; then
    . ~/.bash_highlight.sh
fi

# Run twolfson/sexy-bash-prompt
# https://github.com/twolfson/sexy-bash-prompt
if [ -f ~/.bash_prompt ]; then
    . ~/.bash_prompt
fi

# rbenv
if [ -f ~/.rbenvrc ]; then
    . ~/.rbenvrc
fi

# asdf
if [ -f "/opt/homebrew/opt/asdf/libexec/asdf.sh" ]; then
    source "/opt/homebrew/opt/asdf/libexec/asdf.sh"
fi
if [ -f "/opt/homebrew/etc/bash_completion.d/asdf.bash" ]; then
    source "/opt/homebrew/etc/bash_completion.d/asdf.bash"
fi

RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
export RUBY_CONFIGURE_OPTS

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
