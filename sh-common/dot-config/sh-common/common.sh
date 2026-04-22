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
# shellcheck source=./aliases.sh
[[ -f "$f" ]] && . "$f"

# --- Completions ---
# Shellcheck trys to analyse the file being source but needs a constant path to follow.
# In this case we can disable the check since npm's completion script is not our concern.
# shellcheck disable=SC1090
source <(npm completion)

# Runs devbox script
eval "$(devbox global shellenv --init-hook)"
