if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q orb
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
end

if test -d $HOME/.antigravity/antigravity/bin
    fish_add_path $HOME/.antigravity/antigravity/bin
end

# bun - use mise
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH
