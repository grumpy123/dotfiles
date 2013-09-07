#
# .zshrc is sourced in interactive shells.
# It should contain commands to set up aliases,
# functions, options, key bindings, etc.
#

source ~/.dotfiles-local/zshrc

autoload -U compinit
compinit

#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

## keep background processes at full speed
#setopt NOBGNICE
## restart running processes on exit
#setopt HUP

## history
#setopt APPEND_HISTORY
## for sharing history between zsh processes
#setopt INC_APPEND_HISTORY
#setopt SHARE_HISTORY

## never ever beep ever
#setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# autoload -U colors
#colors
#
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}" end-of-line

# setup local aliases and exports
alias ll='ls -l'
alias la='ls -la'
alias b='cd ..'
alias bb='cd ../..'
alias bbb='cd ../../..'
alias ker='kinit -fl 1d'
alias hist='history 1 | grep'

function gr-svn() {
    local grep_expr=$1
    local grep_path=$2

    if [[ -z "$grep_expr" ]]
    then
        grep_expr="empty-empty-empty"
    fi

    if [[ -z "$grep_path" ]]
    then
        grep_path="*"
    fi

    echo 'grep -ir "$grep_expr" $grep_path | grep -v "\.svn"| grep "$grep_expr"'
    grep -ir "$grep_expr" $grep_path | grep -v "\.svn"| grep "$grep_expr"
}

function agent(){
    local _kk_agent_pid_file=~/.ssh/.agent-pid-file
    if [[ -f $_kk_agent_pid_file ]]
    then
        print 'refreshing agent from file'
        eval `cat $_kk_agent_pid_file`
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
        ssh-agent -s > $_kk_agent_pid_file
        eval `cat $_kk_agent_pid_file`
        ssh-add ~/.ssh/id_rsa.pem
    fi
}


export EDITOR=vim
export P4EDITOR=vim

