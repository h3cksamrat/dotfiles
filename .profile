export ZDOTDIR="$HOME/.config/zsh"
export PNPM_HOME="$HOME/.local/share/pnpm"
export NVM_DIR="$HOME/.nvm"
export VCPKG_ROOT="$HOME/tools/vcpkg"

if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
  fi
fi

if [ -n "$ZSH_VERSION" ]; then
  if [ -f "$ZDOTDIR/.zshrc" ]; then
    . "$ZDOTDIR/.zshrc"
  fi
fi

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
  PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
fi

if [ -d "$HOME/.automation/bin" ] ; then
  PATH="$HOME/.automation/bin:$PATH"
fi

if [ -d "$HOME/.config/bin" ] ; then
  PATH="$HOME/.config/bin:$PATH"
fi

if [ -f "$HOME/.shell/env" ] ; then
  . "$HOME/.shell/env"
fi

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
. "$HOME/.cargo/env"

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

NPM_PACKAGES="$HOME/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
PATH="$HOME/.deno/bin:$PATH"

GOPATH="$HOME/go"
GOROOT="/usr/local/go"
PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

SOLANA_PATH="$HOME/.local/share/solana/install/active_release/bin"

export ANDROID_HOME=$HOME/android/sdk
PATH=$ANDROID_HOME/cmdline-tools/tools/bin/:$PATH
PATH=$ANDROID_HOME/emulator/:$PATH
PATH=$ANDROID_HOME/platform-tools/:$PATH

PATH="/home/samrat/.detaspace/bin:$PATH"
PATH="/home/samrat/github/oss/depot_tools:$PATH"
export PATH="$PATH:$PNPM_HOME:$VCPKG_ROOT:$SOLANA_PATH"
