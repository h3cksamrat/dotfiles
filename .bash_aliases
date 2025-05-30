alias ls="exa"
alias ll="ls -lh"
alias la="ls -a"
# alias lt="ls --human-readable --size -1 -S --classify"
alias cat="bat"

alias gcd='chosed=`find . -maxdepth 1 -type d | gum choose --height 20 | sed -r "s/\x1B\[([0-9]{1,3}(;[0-9]{1,2})?)?[mGK]//g"` && cd $chosed'
alias gitlog="git log --oneline | gum filter | cut -d' ' -f1"
alias serve="browser-sync start --server --files ."
alias gti="git"

alias show_scripts="cat package.json | gron | rg '^json.scripts' | gron -u"
alias ng="~/.local/bin/nest-generator.sh"

alias mnt="mount | awk -F' ' '{ printf \"%s\t%s\n\",\$1,\$3; }' | column -t | egrep ^/dev/ | sort"
alias hg='history|rg'

alias ve='python3 -m venv ./venv'
alias va='source ./venv/bin/activate'
alias vea="ve && va"

alias tht='mv --force -t ~/.local/share/Trash/files/ '
alias rm='tht'

alias ip4="ifconfig | grep 'inet ' -B 1"
alias ssu="sudo systemctl start ssh && ip4 && echo 'ssh server up'"
alias ssd="sudo systemctl stop ssh && echo 'ssh server down'"
alias docker-stop="docker ps | awk -F' ' '{print \$1}' | grep -v CONTAINER | xargs -i docker stop {}"
alias psqlu="docker start postgres-1 adminer-1" # start postgres
alias psqld="docker stop postgres-1 adminer-1" # stop postgres

alias c="clear"
alias ..="cd .."
alias ":q"="exit"

# nvim alias
alias vim="nvim"
alias vi="nvim"
alias wiki="nvim ~/vimwiki/index.wiki"

# fan configs
alias fanspeed="mono /opt/nbfc/nbfc.exe set -s"
alias fanspeed-auto="mono /opt/nbfc/nbfc.exe set -a"
alias fanspeed-status="mono /opt/nbfc/nbfc.exe status -a"

alias battery_level="cat /sys/class/power_supply/BAT1/capacity"
alias game_vim="docker run -it --rm brandoncc/vim-be-good:stable"

alias lg="lazygit"
alias ld="lazydocker"

alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign --message "--wip-- [skip ci]"'

alias gunwip='git rev-list --max-count=1 --format="%s" HEAD | grep -q "\--wip--" && git reset HEAD~1'

# Similar to `gunwip` but recursive "Unwips" all recent `--wip--` commits not just the last one
function gunwipall() {
  local _commit=$(git log --grep='--wip--' --invert-grep --max-count=1 --format=format:%H)

  # Check if a commit without "--wip--" was found and it's not the same as HEAD
  if [[ "$_commit" != "$(git rev-parse HEAD)" ]]; then
    git reset $_commit || return 1
  fi
}
