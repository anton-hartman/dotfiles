# 1. Source the Shared Core -------------
f="$HOME/.config/sh-common/common.sh"
[[ -f "$f" ]] && . "$f"
# ---------------------------------------

# 2. Zsh-specific behavior (Completions)
autoload -U compinit && compinit

# 3. Prompt
eval "$(starship init zsh)"

# Must still be move to shell common
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
