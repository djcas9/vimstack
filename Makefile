PWD := $(shell pwd)

install: clean
	ln -s $(PWD)/vim ~/.vim
	ln -s $(PWD)/vimrc ~/.vimrc
	mkdir -p ~/.vim/autoload
	curl -fLo ~/.vim/autoload/plug.vim https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	vim +PlugInstall +qall
	clear
	@echo "\nDONE - Installation Complete\n"

clean:
	rm -rf $(PWD)/vim/bundle
	rm -rf $(PWD)/vim/plugged
	rm -rf ~/.vim
	rm -rf ~/.vimrc

uninstall: clean

.PHONY: install
