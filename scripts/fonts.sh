#!/usr/bin/env bash

if [ "$OS" = "microsoft" ]; then
	echo 'Just install them yourself for now!!!!!'
elif [ "$OS" = "darwin" ]; then
	### FiraCode
	git clone https://github.com/tonsky/FiraCode.git $HOME/bin/fira
	sudo mkdir -p $HOME/Library/Fonts/firaCode
	sudo cp -a $HOME/bin/fira/distr/ttf/*.ttf $HOME/Library/Fonts/firaCode/

	# Cleanup downloaded fonts
	rm -Rf $HOME/bin/fira
else
	### FiraCode
	git clone https://github.com/tonsky/FiraCode.git $HOME/bin/fira
	sudo mkdir -p /usr/share/fonts/truetype/firaCode
	sudo cp -a $HOME/bin/fira/distr/ttf/*.ttf /usr/share/fonts/truetype/firaCode/

	### Powerline patched fonts
	git clone https://github.com/powerline/fonts.git $HOME/bin/powerline
	sh $HOME/bin/powerline/install.sh

	# Cleanup downloaded fonts
	rm -Rf $HOME/bin/fira
	rm -Rf $HOME/bin/powerline

	# Regenerate fonts
	fc-cache -f -v
fi
