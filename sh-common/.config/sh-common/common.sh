# --- Environment Variables ---
export EDITOR="nvim"
export VISUAL="$EDITOR"

# --- Cross-Platform Homebrew Logic ---
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS (Apple Silicon or Intel)
    [ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
    [ -f /usr/local/bin/brew ] && eval "$(/usr/local/bin/brew shellenv)"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux / WSL
    [ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

# Load Modular Configs
f="$HOME/.config/sh-common/aliases.sh"
[[ -f "$f" ]] && . "$f"
f="$HOME/.config/sh-common/completions.sh"
[[ -f "$f" ]] && . "$f"

# Cross Compatible Completions
source <(npm completion)

# Other
eval "$(devbox global shellenv --init-hook)"