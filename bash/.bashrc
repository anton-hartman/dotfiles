# Exit if not interactive
[[ $- != *i* ]] && return

# 1. Source the Shared Core
f="$HOME/.config/sh-common/.sh_common.sh"
[[ -f "$f" ]] && . "$f"

# 2. Bash-specific behavior
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoreboth

# 3. Bash-specific Completions
f="$HOME/.bash_completions.sh"
[[ -f "$f" ]] && . "$f"

# 4. Prompt
eval "$(starship init bash)"