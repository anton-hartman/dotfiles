# System Completions
f="/usr/share/bash-completion/bash_completion"
[[ -f "$f" ]] && . "$f"

# Tool Specific
f="$HOME/.completion/devbox_completion.sh"
[[ -f "$f" ]] && . "$f"
f="$HOME/.completion/.bash.tmux-bash-completion"
[[ -f "$f" ]] && . "$f"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Expo / EAS CLI
f="$HOME/.cache/eas-cli/autocomplete/bash_setup"
[[ -f "$f" ]] && . "$f"
