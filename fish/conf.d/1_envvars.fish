set -Ux DOTFILES_ROOT "/Users/adamatti/workspace/github_ws/dotfiles"

set -Ux HOMEBREW_NO_ENV_HINTS "true"
set -Ux HOMEBREW_PREFIX "$(brew --prefix)"
set -Ux NEXT_TELEMETRY_DISABLED "true"

# https://martinheinz.dev/blog/110
set -Ux HISTSIZE 10000000
set -Ux SAVEHIST 10000000
set -Ux HISTORY_IGNORE "(ls|pwd|exit|export AWS_|wezterm)*"

set -Ux VISUAL "nano"

set -Ux GRANTED_ALIAS_CONFIGURED "true"
