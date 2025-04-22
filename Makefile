PWD := $(shell pwd)

push:
	@git add . && git commit -a -m 'update' && git push origin master

install: clean
	ln -s -f $(PWD)/vim ~/.vim || true
	ln -s -f $(PWD)/vimrc ~/.vimrc || true
	mkdir -p ~/.vim/autoload || true
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
