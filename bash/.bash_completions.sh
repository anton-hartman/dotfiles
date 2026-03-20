# System Completions
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# Tool Specific Completions
source <(npm completion)
[[ -f ~/.completion/devbox_completion.sh ]] && source ~/.completion/devbox_completion.sh
[[ -f ~/.completion/.bash.tmux-bash-completion ]] && source ~/.completion/.bash.tmux-bash-completion

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# EAS Autocomplete
eval EAS_AC_BASH_SETUP_PATH=$HOME/.cache/eas-cli/autocomplete/bash_setup && test -f $EAS_AC_BASH_SETUP_PATH && source $EAS_AC_BASH_SETUP_PATH
