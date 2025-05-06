if test "$TERM_PROGRAM" = "vscode"
    set -gx STARSHIP_CONFIG "$DOTFILES_ROOT/starship/starship-vscode.toml"
else
    set -gx STARSHIP_CONFIG "$DOTFILES_ROOT/starship/starship.toml"
end
