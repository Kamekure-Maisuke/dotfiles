if [[ ! $(which brew) ]]; then
	echo "HomeBrewがありません。インストールします。"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
fi

echo "パッケージのインストール"

brew bundle && brew cleanup

echo "完了"
