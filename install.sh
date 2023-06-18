#!/bin/bash
# Desc: Install dotfiles
# if -f is passed, overwrite existing files
f="-f"

# Get the options
while getopts ":f" option; do
   case $option in
      f)
         f="-f";;
     \?) # Invalid option
         echo "Error: Invalid option"
         exit;;
   esac
done


function link() {
  source=$1;
  dest=$2;
  echo "Linking $dest to $source" ;
  ln -sf $source $dest;
}

ls .config | xargs -I {} ln -sf $PWD/.config/{} $HOME/.config/
ls bin | xargs -I {} ln -sf $PWD/bin/{} $HOME/.local/bin/{}

link $PWD/.bash_aliases $HOME/.bash_aliases
link $PWD/.bash_functions $HOME/.bash_functions
link $PWD/.profile $HOME/.profile
link $PWD/.xinitrc $HOME/.xinitrc
link $PWD/.Xmodmap $HOME/.Xmodmap
