# ln -s $PWD/zsh/.zshrc ~/.zshrc
# Full sample: https://github.com/ohmyzsh/ohmyzsh/blob/master/templates/zshrc.zsh-template

FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

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

# asdf / nvm / fnm / sdkman / chruby / rbenv / pyenv / rustup / volta / etc
if which mise &> /dev/null; then
  eval "$(mise activate zsh)"
fi

if which walk &> /dev/null; then
  function lk {
    cd "$(walk --icons --preview "$@")"
  }
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

source ${DOTFILES_ROOT}/zsh/after.zsh

ulimit -n 10240

# For Warp (terminal), new line
PROMPT="${PROMPT}"$'\n'
