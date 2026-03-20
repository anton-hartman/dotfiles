# System Completions
[[ -f /usr/share/bash-completion/bash_completion ]] && source /usr/share/bash-completion/bash_completion

# Tool Specific
source <(npm completion)
[[ -f ~/.completion/devbox_completion.sh ]] && source ~/.completion/devbox_completion.sh
[[ -f ~/.completion/.bash.tmux-bash-completion ]] && source ~/.completion/.bash.tmux-bash-completion

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Expo / EAS CLI
[[ -f ~/.cache/eas-cli/autocomplete/bash_setup ]] && source ~/.cache/eas-cli/autocomplete/bash_setup
