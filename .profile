export ZDOTDIR="$HOME/.config/zsh"
export PNPM_HOME="$HOME/.local/share/pnpm"
export NVM_DIR="$HOME/.nvm"
export VCPKG_ROOT="$HOME/tools/vcpkg"


if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then
  PATH="$HOME/.local/bin:$PATH"
fi

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

if [ -d "/home/linuxbrew/.linuxbrew/bin" ] ; then
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
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

if [ -f "$HOME/.cargo/env" ] ; then
  . "$HOME/.cargo/env"
fi

[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

NPM_PACKAGES="$HOME/.npm-packages"
NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
PATH="$NPM_PACKAGES/bin:$PATH"
PATH="$HOME/.deno/bin:$PATH"

GOPATH="$HOME/go"
GOROOT="/usr/local/go"
PATH="$PATH:$GOPATH/bin:$GOROOT/bin"

SOLANA_PATH="$HOME/.local/share/solana/install/active_release/bin"
export PATH="$PATH:$PNPM_HOME:$VCPKG_ROOT:$SOLANA_PATH"

export PKG_CONFIG_PATH=/usr/lib/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/share/pkgconfig

# kitty
export PATH="$HOME/.local/kitty.app/bin:$PATH"

## only if kubectl is installed
if [[ -x "$(command -v kubectl)" ]]; then
source <(kubectl completion zsh)
fi

export PATH="/var/lib/snapd/snap/bin:$PATH"
