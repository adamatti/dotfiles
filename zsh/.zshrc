# ln -s $PWD/zsh/.zshrc ~/.zshrc
# Full sample: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template
pkgs=("node" "terraform" "starship" "java" "ruby")
export DOTFILES_ROOT=~/workspace/github_ws/dotfiles

if [[ $(uname -m) == 'arm64' ]]; then
  # apple m1
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

source ${DOTFILES_ROOT}/zsh/before.zsh

if test -f ~/secret.zsh; then
  source ~/secret.zsh
fi

if containsElement "p10k" "${pkgs[@]}"; then 
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

zstyle ':omz:update' mode auto  # update automatically without asking

plugins=(git)

source $ZSH/oh-my-zsh.sh

if which zoxide &> /dev/null; then
  # z / autojump alternative
  eval "$(zoxide init zsh)"
fi

if containsElement "node" "${pkgs[@]}"; then 
  alias nvm="fnm"
  eval "$(fnm env --use-on-cd)"
fi

if containsElement "p10k" "${pkgs[@]}"; then 
  source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme
  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
fi

if containsElement "starship" "${pkgs[@]}"; then
  if [[ $TERM_PROGRAM == "vscode" ]]; then
    export STARSHIP_CONFIG=${DOTFILES_ROOT}/starship/starship-vscode.toml
  else
    export STARSHIP_CONFIG=${DOTFILES_ROOT}/starship/starship.toml
  fi
  eval "$(starship init zsh)"
fi

if containsElement "java" "${pkgs[@]}"; then
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

if containsElement "ruby" "${pkgs[@]}"; then
  if [[ -r "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh" ]]; then
    source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/chruby.sh"
    source "$HOMEBREW_PREFIX/opt/chruby/share/chruby/auto.sh"
  fi
fi

# https://martinheinz.dev/blog/110
export HISTSIZE=10000000
export SAVEHIST=10000000
export HISTORY_IGNORE="(ls|pwd|exit)*"

export VISUAL="nano"

source ${DOTFILES_ROOT}/zsh/after.zsh

ulimit -n 10240
