# ln -s $PWD/zsh/.zshrc ~/.zshrc
export DOTFILES_ROOT=~/workspace/github_ws/dotfiles
pkgs=("node" "terraform" "starship")
source ${DOTFILES_ROOT}/zsh/main.zsh
source ~/secret.zsh

if containsElement "p10k" "${pkgs[@]}"; then 
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi
fi

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="af-magic"

zstyle ':omz:update' mode auto  # update automatically without asking

plugins=(git z dotenv)

source $ZSH/oh-my-zsh.sh

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