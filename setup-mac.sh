#!bin/bash

GITSOURCE="https://github.com/Kamekure-Maisuke/dotfiles"
TARGET="${HOME}/.dotfiles"
TARGET_MAC="$TARGET/macos"

mkdir -p "${TARGET}"

git clone --recursive "$GITSOURCE" "$TARGET"

FILELISTNAMES=$(find ${TARGET_MAC} -maxdepth 1 -type f | xargs basename)

echo $FILELISTNAMES |
tr ' ' '\n'         |
xargs -I@ ln -s "$TARGET_MAC/@" "$HOME/@"

exit 0