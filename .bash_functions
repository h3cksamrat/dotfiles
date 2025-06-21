#!/bin/bash
# change directory and ls
function cl() {
  DIR="$*";
  # if no DIR given, go home
  if [ $# -lt 1 ]; then
    DIR=$HOME;
  fi;
  builtin cd "${DIR}" && exa
}

function mkcd() {
  DIR="$*";
  if [ $# -lt 1 ]; then
    echo -e "\e[31mdirectory field can't be empty\n\e[0mmkcd <directory>"
    return;
  fi;
  mkdir "${DIR}" && cd "${DIR}"
}

function gitcheat() {
  DATE="$1"
  if [ "$DATE" ]; then
    # Tue Apr 12 15:23:10 2022 +0545
    export GIT_COMMITTER_DATE="$DATE" && git commit --amend --no-edit --date "$DATE"
    return;
  fi;
  echo -e "Provide the date in format:\nTue Apr 12 15:23:10 2022 +0545\n"
}

function grmc() {
  COMMIT="$1"

  git rebase --onto ${COMMIT}^ ${COMMIT} && echo "Removed commit $COMMIT"
}

function gcp() {
  COMMIT="$1"
  FILE="$2"

  git show ${COMMIT}:${FILE} > ${FILE}
}

function pubip() {
  IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
  if [ "$IP" ]; then
    echo "${IP} is your public IP address";
    return;
  fi;
  echo -e "Couldn't connect to internet";
}

function capturePic() {
  ffmpeg -f video4linux2 -s vga -i /dev/video0 -v 0 -vframes 1 /tmp/termCap1.jpg
}

function copy() {
  copyq copy "$1" && copyq add "$1";
}

function clip() {
  local input="$(< /dev/stdin)"
  if [ -z "$input" ];
  then
    copy "$1"
  else
    copy "$input"
  fi
}

function trim() {
  local input="$(< /dev/stdin)"
  if [ -z "$input" ];
  then
    echo "only stdin is supported"
  else
    awk '{$1=$1};1' <<< "$input"
  fi

}

function pdflower() {
  local FILE="$1"
  b gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/screen -dNOPAUSE -dQUIET -dBATCH -sOutputFile="resized_$FILE" "$FILE"
}

function tnew() {
  tmux new -s `pwd | sed 's/.*\///g'`
}

function topen() {
  local tmux_session=`tmux ls | awk -F: '{print $1}'`
  if [ "$tmux_session" ];
  then
    local selected_session=`echo "$tmux_session" | fzf`
    if [ "$selected_session" ];
    then
      tmux attach -t "$selected_session"
    fi
  fi
}

function ttopen() {
  local session=$*;
  if [ "$session" ]; then
    tmux new-session -d -s "$session"
    tmux switch-client -t "$session"
  else
    local tmux_session=`tmux ls | awk -F: '{print $1}'`
    if [ "$tmux_session" ];
    then
      local selected_session=`echo "$tmux_session" | fzf`
      if [ "$selected_session" ];
      then
        tmux new-session -d -s "$selected_session"
        tmux switch-client -t "$selected_session"
      fi
    fi
  fi
  }

function gs() {
  git stash push -m "$*"
}

function gsa() {
  git stash apply stash^{/"$1"}
}

function music() {
  song=$1
  volume=`[ $2 ] && echo "$2" || echo 50`;
  youtube-dl -f bestaudio  ytsearch:"$song" -o - 2>/dev/null | ffplay -nodisp -autoexit -volume $volume -i - &>/dev/null
}

function v() {
  local currentDirectory=`pwd`
  local vim_sessions=`/usr/bin/ls "$currentDirectory"| grep "\.vim"`
  local session_count=`echo $vim_sessions | wc -l`

  if [[ $session_count -eq 0 || -z "$vim_sessions" ]]; then
    nvim $*;
    return;
  elif [[ $session_count -eq 1 ]]; then
    nvim -S $vim_sessions $*;
    return;
  else
    local selected_session=`echo $vim_sessions | fzf --reverse`
    nvim -S $selected_session $*;
    return;
  fi
}

function b() {
  # run original bash command instead of alias
  local command="$@"
  bash -c "$command"
}

function addToPath() {
  if [ -d "$1" ]; then
    if [[ "$PATH" != *"$1"* ]]; then
            export PATH=$PATH:$1;
            return;
    fi;
    echo "Path already exists";
  fi
}

function convertProxyUrlToHttp() {
  # conver domain:port:username:password to http://username:password@domain:port
  local proxyUrl="$1"
  local domain=`echo "$proxyUrl" | awk -F: '{print $1}'`
  local port=`echo "$proxyUrl" | awk -F: '{print $2}'`
  local username=`echo "$proxyUrl" | awk -F: '{print $3}'`
  local password=`echo "$proxyUrl" | awk -F: '{print $4}'`

  if [ -z "$username" ]; then
    echo "export http_proxy=http://$domain:$port"
    echo "export https_proxy=http://$domain:$port"
  else
    echo "export http_proxy=http://$username:$password@$domain:$port"
    echo "export https_proxy=http://$username:$password@$domain:$port"
  fi

}

function fanSpeed() {
  local cpuFanSpeed="$1"
  local gpuFanSpeed="$2"

  if [ -z "$cpuFanSpeed" ] || [ -z "$gpuFanSpeed" ]; then
    echo "Usage: fanSpeed <cpu_fan_speed> <gpu_fan_speed>"
    return;
  fi

  echo "Setting CPU fan speed to $cpuFanSpeed and GPU fan speed to $gpuFanSpeed"
  echo "${cpuFanSpeed},${gpuFanSpeed}" | sudo tee "/sys/module/linuwu_sense/drivers/platform:acer-wmi/acer-wmi/predator_sense/fan_speed" > /dev/null
}
