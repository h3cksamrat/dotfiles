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

function tnew() {
  tmux new -s `pwd | sed 's/.*\///g'`
}

function topen() {
  local tmux_session=`tmux ls | awk -F: '{print $1}'`
  if [ "$tmux_session" ];
  then
    tmux attach -t `echo "$tmux_session" | fzf`
  fi
}

function defTmux() {
  local sessions=`tmux ls | cut -d ':' -f 1`;
  for i in $sessions; do if [ "$i" = "default" ]; then tmux attach -t default; return; fi; done; tmux new -s default; }

# git functions
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

function tmusic() {
  tmux new-session -d -s music
  tmux switch-client -t music
}

function ttopen() {
  local session=$*;
  tmux new-session -d -s "$session"
  tmux switch-client -t "$session"
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
