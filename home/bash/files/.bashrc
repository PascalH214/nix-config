source ~/.bash_exports
source ~/.bash_alias

fastfetch

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

if [[ $- == *i* ]] && command -v blesh-share >/dev/null 2>&1; then
	source -- "$(blesh-share)/ble.sh" --attach=none
	[[ -n ${BLE_VERSION-} ]] || ble-attach
	# Some blesh versions do not provide the color_scheme option.
	if bleopt -p color_scheme >/dev/null 2>&1; then
		bleopt color_scheme=catppuccin_mocha
	fi
fi