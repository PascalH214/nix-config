if [[ $- == *i* ]]; then
  if command -v fastfetch >/dev/null 2>&1; then
    fastfetch --config ~/.config/fastfetch/config.jsonc
  fi

  echo -e "Don't forget about:"
  echo -e "\033[38;2;180;190;254mman (1)\033[0m    - an interface to the system reference manuals"
  echo -e "\033[38;2;180;190;254mwhatis (1)\033[0m - display one-line manual page descriptions\n"

  if command -v blesh-share >/dev/null 2>&1; then
    source -- "$(blesh-share)/ble.sh" --attach=none
    [[ -n ${BLE_VERSION-} ]] || ble-attach

    if bleopt -p color_scheme >/dev/null 2>&1; then
      bleopt color_scheme=catppuccin_mocha
    fi
  fi
fi
