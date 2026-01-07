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
    export PATH=/opt/homebrew/bin:/usr/local/bin:/usr/local/sbilsk:$PATH
fi
export PATH=~/bin/:$PATH

# USER without dots (K8s doesn't like dots in pod names)
export DASH_USER="${USER:gs/\./-/}"

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
bindkey "^F" history-search-backward
bindkey -M vicmd "^F" history-search-backward
bindkey "^G" send-break
bindkey -M vicmd "^G" send-break

# Enable full-screen editor
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd "v" edit-command-line

# Case insensitive completion
setopt EXTENDEDGLOB 
setopt NO_CASE_GLOB
setopt NUMERIC_GLOB_SORT
setopt INTERACTIVE_COMMENTS

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

function _gr_git_master() {
    git symbolic-ref refs/remotes/origin/HEAD | sed 's/refs\/remotes\/origin\///'
}

# setup local aliases and exports
alias reload-zshrc=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias cat-zsh='cat ~/.zshrc ~/.dotfiles-local/zshrc*'
alias vim-zsh='vim ~/.zshrc'
alias vim-post-zsh='vim ~/.dotfiles-local/zshrc-post'
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
alias md='mkdir'

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
alias -g TTA='2>&1 | tee -a ~/tmp/tmp'
alias -g TO='2>&1 | tee -a ~/bin/oncall.log'
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

alias ta-kko='tmux new-session -A -D -s kko'
alias ta-bg='tmux new-session -A -D -s bg \; set -t bg status-style "bg=color63"'
alias ta-priv='tmux new-session -A -D -s priv \; set -t priv status-style "bg=color1"'

alias vcreate='python3 -m venv venv'
alias ve='source venv/bin/activate'
alias vimp='vim -p'

alias glog='git log --oneline --decorate --first-parent -n'
alias glog3='glog 3'
alias hgst='git st'
alias hgdiff='git diff'
alias hgdf='git diff'
alias hgci='git add . && git ci'
alias hga='gadd && git ci --amend'
alias hgsl='glog 8'
alias __git_branch='git branch --show-current'
alias gpull='git fetch origin $(_gr_git_master) && git merge origin/$(_gr_git_master)'
alias grebase='git fetch origin $(_gr_git_master) && git rebase -i origin/$(_gr_git_master)'
alias greset='git fetch origin && git reset --hard origin/$(__git_branch)'
alias gmaster='git co $(_gr_git_master)'
alias gadd='git add -A'
alias gshow='git show'
alias hgshow='gshow'
alias gpush='[[ "$(git rev-parse --abbrev-ref HEAD)" != "master" ]] && git push origin'
alias brls='git branch -vv'
alias brrm='git branch -D'
alias brco='git co'

alias gsync='gt sync'
alias gco='gt co'
alias gss='gt restack && gt ss'
alias gup='gt up'
alias gnext='gt up'
alias gdown='gt down'
alias gprev='gt down'
alias gcreate='gadd && gt create'

alias go-dotfiles='cd ~/dotfiles'
alias go-tt='cd ~/tmp'
alias ctt='cat ~/tmp/tmp'
alias ltt='less ~/tmp/tmp'
alias ttt='tail -f ~/tmp/tmp'
alias gtt='ctt | grep'
alias tto='tail -n 40 ~/bin/oncall.log'
alias wgeto='wget -q -O -'

alias kc='kubectl'
alias kc-debug='kc run $DASH_USER-shell --restart=Never --rm -i --tty --image debian -- bash'

alias tf=terraform

alias set-sudop='read -s "Stored in rootp car" sudop'

#compdef gt
###-begin-gt-completions-###
#
# yargs command completion script
#
# Installation: gt completion >> ~/.zshrc
#    or gt completion >> ~/.zprofile on OSX.
#
_gt_yargs_completions()
{
    local reply
    local si=$IFS
    IFS=$'
    ' reply=($(COMP_CWORD="$((CURRENT-1))" COMP_LINE="$BUFFER" COMP_POINT="$CURSOR" gt --get-yargs-completions "${words[@]}"))
    IFS=$si
    _describe 'values' reply
}
compdef _gt_yargs_completions gt
###-end-gt-completions-###

export KC_DEBUG_IMAGE='debian'
function kc-debug-it () {
    if [[ -z "$1" ]]
    then
        echo "Must provide cluster"
        return 1
    fi

    if [[ -z "$2" ]]
    then
        echo "Must provide namespace"
        return 1
    fi

    local _kc_image=${3:-$KC_DEBUG_IMAGE}

    kc --context="$1" --namespace="$2" run "$DASH_USER-shell" --restart=Never --rm -i --tty --image $_kc_image
}

export _BR_PREFIX=
function brnew() {
    if [[ -z "$1" ]]
    then
        echo "Must provide branch name"
        return 1
    fi

    # Depends on git-extras: brew install git-extras
    # git create-branch -r "$_BR_PREFIX$1"
    git co -b "$_BR_PREFIX$1"
}

function brswitch() {
    local _branch=$(git symbolic-ref --short)

    if [[ -z "$1" ]]
    then
        echo "Must provide target commit or branch"
        return 1
    fi

    git co "$1"
    git switch -C "$_branch"
}

function fname() {
    find . -type f -iname '*'$*'*' -ls
}

function calc_() {
  echo "$(($@))"
}
alias cl='noglob calc_'

export EDITOR=vim
export P4EDITOR=vim
export VISUAL=vim

source ~/.dotfiles-local/zshrc-post

