# Vimux - The Mephux Collection.

## Install

  1) `make install`

  2) `vim +BundleInstall +qall # install all default plugins`

## Commands

  NOTE: The default `<Leader>` is set to `\`

  * `ctrl + p`  - fuzzy file finder via ctrlp (https://github.com/kien/ctrlp.vim)
  * `<Leader>b` - ctrlp buffer search
  * `<Leader>f` - ctrlp function search
  * `<c-f>`     - search via Ack (https://github.com/mileszs/ack.vim - `brew install ack` or `sudo apt-get install ack-grep`)
  * `<Leader>o` - git commit viewer via vim-extradite (https://github.com/int3/vim-extradite)
  * `<Leader>q` - quickfix
  * `<Leader>w` - write file
  * `shift+s"`  - surround selected char/word with ""
  * `<Leader>c` - toggle software caps lock
  * `<Leader>p` - toggle paste mode

## HTML

  * Invoke html completion with `ctrl + e` using emmet-vim (https://github.com/mattn/emmet-vim)

  * Example
    - `div#hello` followed by `ctrl + e` = `<div id="hello"></div>`
    - `div.world` followed by `ctrl + e` = `<div class="word"></div>`
    - etc..

## Uninstall

  `make uninstall` or `make clean`

Default color scheme is threatstack

![Epix](https://github.com/mephux/vimux/raw/master/vimux.png)
