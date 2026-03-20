# --- Navigation & Listing ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# --- Dev Tools ---
alias lg='lazygit'

# --- Functions ---
isdev() {
  if [[ $DEVBOX_SHELL_ENABLED == 1 ]]; then
    echo "Devbox shell👍"
  else
    echo "Not Devbox shell👎"
  fi
}

dev() {
  devbox shell "$@"
}
