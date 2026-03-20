# --- Standard Aliases ---
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias grep='grep --color=auto'

# --- Project & Tool Aliases ---
alias lg='lazygit'
alias config='/usr/bin/git --git-dir=$HOME/.cfg.git/ --work-tree=$HOME'
alias lazyconfig='lazygit --git-dir ~/.cfg.git/ --work-tree ~'

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
