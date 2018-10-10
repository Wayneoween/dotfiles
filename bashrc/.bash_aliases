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

alias bashaliases='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'
alias brew="PATH=/Users/wayne/.rbenv/shims:/Users/wayne/.rbenv/bin:/Users/wayne/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/Applications/Wireshark.app/Contents/MacOS brew"
alias cask="brew cask"
alias digall='dig +noall +answer +multiline any'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias gitconfig='vim ~/.gitconfig'
alias gpg='gpg2'
alias grep='grep --color=auto'
alias irb="irb -r irb/completion"
alias irb='irb -r irb/completion'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias mpv='mpv --cache=400000 '
alias python='python3'
alias scrn='mate-screenshot --interactive'
alias sshconf='vim ~/.ssh/config'
alias t=task
alias update='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias upgrade='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias v='vagrant'
alias vimrc='vim ~/.vimrc'
alias watch='watch -c '

function ddig {
    ip=$(dig +short "$1")
    echo "$ip"
    dig +short -x "$ip"
}

