alias psqlu="docker start postgres-1 adminer-1" # start postgres
alias psqld="docker stop postgres-1 adminer-1" # stop postgres
alias ls="exa --icons"
alias ll="ls -lh"
alias la="ls -a"
# alias lt="ls --human-readable --size -1 -S --classify"
alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias gh='history|rg'
alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias vea="ve && va"
alias tht='mv --force -t ~/.local/share/Trash/files/ '
alias rm='tht'
alias ip4="ifconfig | grep 'inet ' -B 1"
alias ssu="sudo systemctl start ssh && ip4 && echo 'ssh server up'"
alias ssd="sudo systemctl stop ssh && echo 'ssh server down'"
alias c="clear"
alias ..="cd .."

# nvim alias
alias vim="nvim"
alias vi="nvim"

# javascript alias
alias yi="yarn install"
alias ya="yarn add"
alias yr="yarn remove"
alias yci="yarn install --pure-lockfile"

alias ni="npm install"
alias nu="npm uninstall"
alias nin="npm init"
alias nci="npm ci"

# docker alias
alias docker-stop="docker ps | awk -F' ' '{print \$1}' | grep -v CONTAINER | xargs -i docker stop {}"

# fan configs
alias fanspeed="mono /opt/nbfc/nbfc.exe set -s"
alias fanspeed-auto="mono /opt/nbfc/nbfc.exe set -a"
alias fanspeed-status="mono /opt/nbfc/nbfc.exe status -a"

alias open="nemo"
alias battery_level="cat /sys/class/power_supply/BAT1/capacity"
alias q="exit"
alias game_vim="docker run -it --rm brandoncc/vim-be-good:stable"
