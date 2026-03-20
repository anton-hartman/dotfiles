# ~/.bashrc

# 1. Exit if not interactive (i.e., used by a human and not a script)
case $- in
*i*) ;;
*) return ;;
esac

# 2. Sensible Defaults
HISTCONTROL=ignoreboth
shopt -s histappend
shopt -s checkwinsize
# Allow ** to match subdirectories
shopt -s globstar

# 3. Load Modular Files
[[ -f ~/.bash_aliases ]] && . ~/.bash_aliases
[[ -f ~/.bash_completions ]] && . ~/.bash_completions

# 4. Tool Initializations
# Environment
export EDITOR="nvim"
export VISUAL="$EDITOR"

# Homebrew (Mac or Linux Path)
if [[ "$OSTYPE" == "darwin"* ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv bash)"
fi

# Devbox Global
eval "$(devbox global shellenv --init-hook)"

# Starship Prompt (Handles your prompt for you)
eval "$(starship init bash)"
