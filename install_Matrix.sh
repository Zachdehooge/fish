#!/usr/bin/env bash
# Put this fish config in place and switch oh-my-fish to the matrix theme.
# Clone straight into ~/.config/fish, or anywhere else to have it linked there.
set -euo pipefail

d=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
config=${XDG_CONFIG_HOME:-$HOME/.config}
omf_path=${XDG_DATA_HOME:-$HOME/.local/share}/omf

link() {
    local src=$1 dst=$2
    mkdir -p "$(dirname "$dst")"
    if [[ -e $dst && ! -L $dst ]]; then
        mv "$dst" "$dst.bak.$(date +%s)"
        echo "moved $dst aside"
    fi
    ln -sfn "$src" "$dst"
}

if ! command -v fish >/dev/null; then
    echo "fish is not installed; install it with your package manager first" >&2
    exit 1
fi

if [[ $d != "$(realpath -m "$config/fish")" ]]; then
    if [[ -e $config/fish && ! -L $config/fish ]]; then
        old=$config/fish.bak.$(date +%s)
        mv "$config/fish" "$old"
        echo "moved $config/fish aside to $old"
        [[ -e $d/fish_variables || ! -e $old/fish_variables ]] || cp -a "$old/fish_variables" "$d/"
    fi
    link "$d" "$config/fish"
fi
link "$d/omf/matrix" "$config/omf/themes/matrix"

if [[ ! -f $omf_path/init.fish ]]; then
    command -v curl >/dev/null || { echo "curl is needed to install oh-my-fish" >&2; exit 1; }
    echo "oh-my-fish not found, installing it"
    tmp=$(mktemp)
    trap 'rm -f "$tmp"' EXIT
    curl -fsSL https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install -o "$tmp"
    fish "$tmp" --noninteractive --yes
fi

fish -c 'omf theme matrix'
echo "matrix theme set; open a new fish shell to see it"
