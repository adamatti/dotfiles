if type -q starship
    starship init fish | source
end
if type -q zoxide
    zoxide init fish | source
end
if type -q mise
    # Not needed. It is already activate somewhere else
    # mise activate fish | source
end
