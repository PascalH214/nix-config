if [[ -z "${TZ:-}" ]]; then
  if [[ -f /etc/timezone ]]; then
    export TZ="$(cat /etc/timezone)"
  else
    export TZ="UTC"
  fi
fi

append_path_if_missing() {
  local directory="$1"

  [[ -n "$directory" ]] || return
  [[ -d "$directory" ]] || return

  case ":$PATH:" in
    *":$directory:"*) ;;
    *) PATH="$PATH:$directory" ;;
  esac
}

append_path_if_missing "$HOME/bin"
append_path_if_missing "$HOME/Applications/clion/bin"
append_path_if_missing "$HOME/.local/share/nvim/mason/bin"
append_path_if_missing "$HOME/.local/bin"
export PATH

export XDG_CONFIG_HOME="$HOME/.config"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export DISABLE_AUTO_TITLE="true"

set -o vi
