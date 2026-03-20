# ~/.bashrc

# 1. Non-interactive shell check
[[ $- != *i* ]] && return

# 2. Cross-Platform Homebrew Initialization
# Check common paths for macOS and Linux
if [[ -f /opt/homebrew/bin/brew ]]; then
  # Apple Silicon Mac
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -f /home/linuxbrew/.linuxbrew/bin/brew ]]; then
  # Linux / WSL
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

# 3. Load Modular Configs (Stow-friendly)
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_completions ]] && . ~/.bash_completions

# 4. Global Tool Init
export EDITOR="nvim"
export VISUAL="$EDITOR"

eval "$(starship init bash)"
eval "$(devbox global shellenv --init-hook)"

# 5. Bash-specific behavior
shopt -s histappend
shopt -s checkwinsize
HISTCONTROL=ignoreboth
