# change directory and ls
function cl() {
    DIR="$*";
        # if no DIR given, go home
        if [ $# -lt 1 ]; then
                DIR=$HOME;
    fi;
    builtin cd "${DIR}" && \
    # use your preferred ls command
        ls -F --color=auto
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
