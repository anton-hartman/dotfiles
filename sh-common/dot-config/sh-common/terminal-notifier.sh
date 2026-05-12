# Core helper: send a macOS notification
tn_notify() {
  local title="${1:-Terminal}"
  local message="${2:-}"
  local sound="${3:-default}"

  # Adjust path if terminal-notifier is installed somewhere else
  terminal-notifier \
    -title "$title" \
    -message "$message" \
    -sound "$sound" \
    >/dev/null 2>&1
}

# Notify based on last command's exit status
notify() {
  # Capture the previous command's exit code *before* doing anything else
  local exit_code=$?

  if [ "$exit_code" -eq 0 ]; then
    tn_notify "Command Succeeded" "$*" "Glass"
  else
    tn_notify "Command Failed (exit $exit_code)" "$*" "Basso"
  fi

  return "$exit_code"
}

# Convenience wrappers to call explicitly
tn_success() {
  tn_notify "Success" "$*" "Glass"
}

tn_fail() {
  tn_notify "Failure" "$*" "Basso"
}
