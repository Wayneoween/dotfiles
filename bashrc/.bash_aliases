platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

alias bashaliases='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'
alias brew="PATH=/Users/wayne/.rbenv/shims:/Users/wayne/.rbenv/bin:/Users/wayne/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/MacGPG2/bin:/Library/TeX/texbin:/Applications/Wireshark.app/Contents/MacOS brew"
alias cask="brew cask"
alias d='docker'
alias dcom='docker-compose'
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
if [ $platform != 'linux' ]; then
    alias ls='ls -G'
else
    alias ls='ls --color=auto'
fi
alias python='python3'
alias scrn='mate-screenshot --interactive'
alias sshconfig='vim ~/.ssh/config'
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

