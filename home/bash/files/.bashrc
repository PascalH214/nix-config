source ~/.bash_exports
source ~/.bash_alias

if [[ $(which fastfetch) ]]; then
  fastfetch
fi

echo -e "Don't forget about:"
echo -e "\033[38;2;180;190;254mman (1)\033[0m    - an interface to the system reference manuals"
echo -e "\033[38;2;180;190;254mwhatis (1)\033[0m - display one-line manual page descriptions\n"

set -o vi

if [[ $(which oh-my-posh) ]]; then
  eval "$(oh-my-posh init bash --config ~/.poshthemes/catppuccin_mocha.omp.json)"
fi

if [[ $(which zoxide) ]]; then
  eval "$(zoxide init bash)"
fi

# sdkman
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

source -- ~/.local/share/blesh/ble.sh
bleopt color_scheme=catppuccin_mocha
