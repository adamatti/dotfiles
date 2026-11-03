if status is-interactive
    # Commands to run in interactive sessions can go here
end

if type -q orb
    source ~/.orbstack/shell/init2.fish 2>/dev/null || :
end

if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end

if test -d $HOME/.bun/bin
    fish_add_path "$HOME/.bun/bin"
end

if test -d $HOME/.antigravity/antigravity/bin
    fish_add_path $HOME/.antigravity/antigravity/bin
end

# bun - use mise
# set --export BUN_INSTALL "$HOME/.bun"
# set --export PATH $BUN_INSTALL/bin $PATH

# Added by Antigravity IDE
if test -d $HOME/.antigravity-ide/antigravity-ide/bin
    fish_add_path $HOME/.antigravity-ide/antigravity-ide/bin
end
