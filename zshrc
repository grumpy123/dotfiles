#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

source ~/.dotfiles-local/zshrc

if [[ "$TERM" == "xterm" ]]
then
    echo 'Override $TERM variable to xterm-256color'
    export TERM=xterm-256color
fi

autoload -U compinit
compinit

autoload -U colors
colors

source ~/dotfiles/zsh/themes/forloop7.theme 

# VIM is better than Emacs
bindkey -v
# 10ms for key sequences
export KEYTIMEOUT=1

# Makes brew-managed stuff the default under OSX
if [[ "$(uname)" == "Darwin" ]]; then
    export PATH=/usr/local/bin:/usr/local/sbin:~/Library/Haskell/bin:$PATH
else
    export PATH=~/.cabal/bin:$PATH
fi
# promptinit

# Disable Ctl+S freezing the terminal
stty -ixon

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

#pushes current command on command stack and gives blank line, after that line
#runs command stack is popped
bindkey "^T" push-line-or-edit
bindkey -M vicmd "^T" push-line-or-edit

bindkey "^R" history-incremental-search-backward
bindkey -M vicmd "^R" history-incremental-search-backward
bindkey "^G" send-break
bindkey -M vicmd "^G" send-break

# Enable full-screen editor
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# Case insensitive completion
setopt EXTENDEDGLOB 
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY
#setopt APPEND_HISTORY
HISTFILE=$HOME/.zhistory
HISTSIZE=SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_DUPS
setopt HIST_VERIFY
# Don't confirm every rm * :)
setopt RMSTARSILENT

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# From: http://zshwiki.org/home/zle/bindkeys
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"    ]]  && bindkey  "${key[Home]}"    beginning-of-line
[[ -n "${key[End]}"     ]]  && bindkey  "${key[End]}"     end-of-line
[[ -n "${key[Insert]}"  ]]  && bindkey  "${key[Insert]}"  overwrite-mode
[[ -n "${key[Delete]}"  ]]  && bindkey  "${key[Delete]}"  delete-char
[[ -n "${key[Up]}"      ]]  && bindkey  "${key[Up]}"      up-line-or-history
[[ -n "${key[Down]}"    ]]  && bindkey  "${key[Down]}"    down-line-or-history
[[ -n "${key[Left]}"    ]]  && bindkey  "${key[Left]}"    backward-char
[[ -n "${key[Right]}"   ]]  && bindkey  "${key[Right]}"   forward-char

# Disable this if need to use PuTTY, this wasn't working when connecting from PuTTY to RHEL
# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
function zle-line-init () {
    echoti smkx
}
function zle-line-finish () {
    echoti rmkx
}
zle -N zle-line-init
zle -N zle-line-finish  

autoload -Uz add-zsh-hook

function _gr_store_cmd() {
  _grumpy_curr_cmd_sc="$1"
}
add-zsh-hook preexec _gr_store_cmd

function _gr_get_cmd() {
  echo "$_grumpy_curr_cmd_sc"
}

# setup local aliases and exports
alias reload-zshrc=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

# TODO: check if grep understands --color

if [[ "$(uname)" == "Darwin" ]]; then
    alias grep='grep --color=auto'
    alias ls='ls -G'
else
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
fi
alias ll='ls -lh'
alias la='ls -lah'

alias less='less -S'

alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias bbbb='cd ../../../..'
alias bbbbb='cd ../../../../..'
alias ker='kinit -fl 1d'
alias reload='fc -R'
alias ng='noglob'

alias -g H='| head'
alias -g T='2>&1 | tee'
alias -g TT='2>&1 | tee ~/tmp/tmp'
alias -g TA='2>&1 | tee -a'
alias -g TL='| tail'
alias -g G='| grep'
alias -g L="| less"
alias -g M="| most"
alias -g HL="--help | less"
alias -g LL="2>&1 | less"
alias -g CA="2>&1 | cat"
alias -g NE="2> /dev/null"
alias -g NUL="> /dev/null 2>&1"
alias -g X1='| xargs -n1 -r'

alias ta='tmux new-session -A -D -s kko'

alias ve='source env/bin/activate'
alias vimp='vim -p'

alias glog='git log -n'
alias glog3='glog 3'
alias hgst='git st'
alias hgdiff='git diff'
alias hgdf='git diff'
alias hgci='git add . && git ci'
alias hga='git add . && git ci --amend'
alias hgsl='glog 8'
alias gpull='git pull origin master'
alias gpush='[[ "$(git rev-parse --abbrev-ref HEAD)" != "master" ]] && git push origin -f'
alias gbrnew='git create-branch -r'
alias gbrls='git branch -vv'

alias ctt='cat ~/tmp/tmp'
alias ltt='less ~/tmp/tmp'
alias ttt='tail ~/tmp/tmp'
alias gtt='ctt | grep'

alias kc='kubectl'

function fname() {
    find . -type f -iname '*'$*'*' -ls
}

function agent-add() {
    local add_key_bin=ssh-add
    local key_file_path=
    local key_pkcs11=

    if [[ -n "$SSH_ADD_KEY_BIN" ]]
    then
        local add_key_bin=$SSH_ADD_KEY_BIN
    fi

    if [[ -n "$SSH_KEY_FILE_PATH" ]]
    then
        local key_file_path=$SSH_KEY_FILE_PATH
    fi

    if [[ -n "$SSH_KEY_PKCS11_LIB" ]]
    then
        local key_pkcs11=$SSH_KEY_PKCS11_LIB
    fi

    if [[ -n "$key_file_path" ]]
    then
        $add_key_bin $key_file_path
    fi

    if [[ -n "$key_pkcs11" ]]
    then
        $add_key_bin -s $key_pkcs11
    fi
}

function agent() {
    local agent_bin=ssh-agent

    if [[ -n "$SSH_AGENT_BIN" ]]
    then
        local agent_bin=$SSH_AGENT_BIN
    fi

    local agent_pid_file=~/.ssh/.agent-pid-file
    if [[ -f $agent_pid_file ]]
    then
        print 'refreshing agent from file'
        eval `cat $agent_pid_file`
    else
        print 'no agent-pid file, cleaning environment'
        SSH_AGENT_PID=
    fi

    # in case ssh-agent has died, we need to clean the $SSH_AGENT_PID variable
    if [[ ( -n "$SSH_AGENT_PID" ) && ( -z "`ps -e | grep $SSH_AGENT_PID | grep ssh-agent`" ) ]] 
    then
        print 'cleaning $SSH_AGENT_PID variable'
        SSH_AGENT_PID=
    fi

    # if the agent is not running, start it
    if [[ -z "$SSH_AGENT_PID" ]]
    then
        print 'Starting new agent'
        $agent_bin -s > $agent_pid_file
        eval `cat $agent_pid_file`

        agent-add
    fi
}

alias kill-agent='killall ssh-agent'

function calc_() {
  echo "$(($@))"
}
alias cl='noglob calc_'

export EDITOR=vim
export P4EDITOR=vim
export VISUAL=vim

source ~/.dotfiles-local/zshrc-post
