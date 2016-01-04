# Vim Stack - The Mephux Collection.

## Why?

  I want a good quality vim setup that does not depend on ruby, perl or python. Just pure old vimscript for
  easy deployment to whatever box I am currently using. (i.e it will fallback gracefully)

  VimStack by default is mostly setup for work in ruby, javascript, html, css, go and c. However, adding plugins to extend
  it for whatever tools you need is trivial.

  Vimux comes with two color schemas: epix and mephux. Both color schemas were created by me modified from 
  ir_black (https://github.com/wesgibbs/vim-irblack). The default color schema is mephux.

## Install

  * `make install`
  * `vim +BundleInstall +qall # install all default plugins`

  For NerdTree file icons (devicons) see https://github.com/ryanoasis/vim-devicons

## Commands

  NOTE: The default `<Leader>` is set to `\`

  * `ctrl + p`  - fuzzy file finder via ctrlp (https://github.com/kien/ctrlp.vim)
  * `<Leader>b` - ctrlp buffer search
  * `<Leader>f` - ctrlp function search
  * `<Leader>r` - ctrlp register search
  * `<c-f>`     - search via Ack (https://github.com/mileszs/ack.vim - `brew install ack` or `sudo apt-get install ack-grep`)
  * `<Leader>o` - git commit viewer via vim-extradite (https://github.com/int3/vim-extradite)
  * `<Leader>q` - quickfix
  * `<Leader>w` - write file
  * `shift+s"`  - surround selected char/word with ""
  * `<Leader>c` - toggle software caps lock
  * `<Leader>p` - toggle paste mode
  * `gof`: **Go** to the current file's directory in the **F**ile manager 
  * `got`: **Go** to the current file's directory in the **T**erminal
    * See the *Platform Support* section (below) for details on which terminal is chosen
  * `goF`: like `gof` for the current "session" directory, that is, the directory
    returned by `:pwd`
  * `goT`: like `got` for the current "session" directory

## HTML

  * Invoke html completion with `ctrl + e` using emmet-vim (https://github.com/mattn/emmet-vim)

  * Example
    - `div#hello` followed by `ctrl + e` = `<div id="hello"></div>`
    - `div.world` followed by `ctrl + e` = `<div class="word"></div>`
    - etc..

## Uninstall

  `make uninstall` or `make clean`

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## TODO
  * I need to clean up the vimrc - it's a crazy mess but it's solid.

## Look At Me

![Epix](https://github.com/mephux/vimux/raw/master/vimux.png)
