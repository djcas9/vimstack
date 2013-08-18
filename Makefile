PWD := $(shell pwd)

install: uninstall
	ln -s $(PWD)/vim ~/.vim
	ln -s $(PWD)/vimrc ~/.vimrc
	ln -s $(PWD)/gvimrc ~/.gvimrc
	git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	@echo "\nInstallation Complete - Now run: vim +BundleInstall +qall \n"

uninstall:
	rm -rf $(PWD)/vim/bundle/*
	rm -rf ~/.vim
	rm -rf ~/.vimrc
	rm -rf ~/.gvimrc

.PHONY: install
