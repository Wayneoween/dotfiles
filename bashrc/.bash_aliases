# shellcheck disable=SC2039

platform='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
elif [[ "$unamestr" == 'Darwin' ]]; then
   platform='osx'
fi

alias bashaliases='vim ~/.bash_aliases'
alias bashrc='vim ~/.bashrc'
alias cask="brew cask"
if command -v bat &> /dev/null
then
    alias cat='bat'
fi
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
if command -v exa &> /dev/null
then
    alias ls='exa'
else
    if [ $platform != 'linux' ]; then
        alias ls='ls -G'
    else
        alias ls='ls --color=auto'
    fi
fi
alias sshconfig='vim ~/.ssh/config'
alias update='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias upgrade='sudo apt update && sudo apt upgrade && sudo apt autoremove'
alias vimrc='vim ~/.vimrc'
alias watch='watch -c '

ddig() {
    ip=$(dig +short "$1")
    echo "$ip"
    dig +short -x "$ip"
}

