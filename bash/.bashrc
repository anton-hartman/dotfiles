# Exit if not interactive
[[ $- != *i* ]] && return

# 1. Source the Shared Core -------------
f="$HOME/.config/sh-common/common.sh"
[[ -f "$f" ]] && . "$f"
# ---------------------------------------

# 2. Bash-specific behavior
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoreboth

# 3. Prompt
eval "$(starship init bash)"

# ---- Bash Completions ----

# System Completions
f="/usr/share/bash-completion/bash_completion"
[[ -f "$f" ]] && . "$f"

# Devbox
f="$HOME/.completion/devbox_completion.sh"
[[ -f "$f" ]] && . "$f"

# Tmux
f="$HOME/.completion/.bash.tmux-bash-completion"
[[ -f "$f" ]] && . "$f"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Expo / EAS CLI
f="$HOME/.cache/eas-cli/autocomplete/bash_setup"
[[ -f "$f" ]] && . "$f"

# FZF
eval "$(fzf --bash)"

# Time Warrior
source ~/.completion/timew-bashcompletion/timew

# Zoxide
eval "$(zoxide init --cmd cd bash)"

