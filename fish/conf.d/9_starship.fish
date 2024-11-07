if test "$TERM_PROGRAM" = "vscode"
    set -Ux STARSHIP_CONFIG "$DOTFILES_ROOT/starship/starship-vscode.toml"
else
    set -Ux STARSHIP_CONFIG "$DOTFILES_ROOT/starship/starship.toml"
end
