# Start or reuse ssh-agent (only once per session)
if not pgrep -u $USER ssh-agent > /dev/null
    eval (ssh-agent -c)
    set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
    set -Ux SSH_AGENT_PID $SSH_AGENT_PID
end

# Automatically load your SSH key(s) with passphrase cached
if not ssh-add -l > /dev/null 2>&1
    ssh-add ~/.ssh/id_ed25519 2>/dev/null
    # or: ssh-add ~/.ssh/id_rsa
    # or load all keys: ssh-add -A
end