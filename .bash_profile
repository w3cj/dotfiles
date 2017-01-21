HOST_NAME=minima

source ~/.nvm/nvm.sh
nvm use 7
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
bldgrn='\e[1;32m' # Green
txtpur='\e[0;35m' # Purple
txtrst='\e[0m'    # Text Reset

emojis=("👾" "🌐" "🎲" "🌍" "🐉" "🌵")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI >"

fortune | cowsay -f tux

function mkcd()
{
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias 🍺="git checkout -b drunk"
alias a='atom .'
alias reveal-md="reveal-md --theme night --highlightTheme hybrid --port 1337"
alias ns='npm start'
alias start='npm start'
alias nr='npm run'
alias run='npm run'
alias nis='npm i -S'
alias clr="clear" # Clear your terminal screen
alias flush="sudo discoveryutil udnsflushcaches" # Flush DNS (Yosemite)
alias flush="killall -HUP mDNSResponder" # Flush DNS (Mavericks, Mountain Lion, Lion)
alias flush="dscacheutil -flushcache" # Flush DNS (Snow Leopard, Leopard)
alias ip="curl icanhazip.com" # Your public IP address
alias ll="ls -al" # List all files in current directory in long list format
alias ldir="ls -al | grep ^d" # List all directories in current directory in long list format
alias o="open ." # Open the current directory in Finder
alias ut="uptime" # Computer uptime

# ----------------------
# Git Aliases
# ----------------------
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git log'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gpsh='git push'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gs='echo ""; echo "*********************************************"; echo -e "   DO NOT FORGET TO PULL BEFORE COMMITTING"; echo "*********************************************"; echo ""; git status'

alias gg='echo -e " ga=git add\n gaa=git add .\n gaaa=git add -A\n gb=git branch\n gbd=git branch -d \n gc=git commit\n gcm=git commit -m\n gco=git checkout\n gcob=git checkout -b\n gcom=git checkout master\n gd=git diff\n gda=git diff HEAD\n gi=git init\n gl=git log\n glg=git log --graph --oneline --decorate --all\n gld=git log --pretty=format:"%h %ad %s" --date=short --all\n gm=git merge --no-ff\n gp=git pull\n gpsh=git push\n gss=git status -s\n gst=git stash\n gstl=git stash list\n gstp=git stash pop\n gstd=git stash drop"'

# ----------------------
# Git Functions
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }
