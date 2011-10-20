#!/usr/bin/env ruby

path = File.expand_path(File.dirname(File.dirname(__FILE__)))
Dir.chdir(path)

# ++++++++++++++++ #
# Vim Plugin Repos #  
# ++++++++++++++++ #

bundles = {
       'vim-bundler' =>            'https://github.com/tpope/vim-bundler.git' ,
       'bufexplorer' =>  'https://github.com/vim-scripts/bufexplorer.zip.git' ,
       'delimitMate' =>         'https://github.com/Raimondi/delimitMate.git' ,
     'nerdcommenter' =>     'https://github.com/scrooloose/nerdcommenter.git' ,
           'tabular' =>            'https://github.com/godlygeek/tabular.git' ,
         'vim-align' =>             'https://github.com/tsaleh/vim-align.git' ,
      'vim-fugitive' =>           'https://github.com/tpope/vim-fugitive.git' ,
      'vim-markdown' =>      'https://github.com/plasticboy/vim-markdown.git' ,
        'vim-repeat' =>             'https://github.com/tpope/vim-repeat.git' ,
          'vim-ruby' =>            'https://github.com/vim-ruby/vim-ruby.git' ,
         'vim-rails' =>              'https://github.com/tpope/vim-rails.git' ,
    'vim-unimpaired' =>         'https://github.com/tpope/vim-unimpaired.git' ,
         'ctags.vim' =>        'https://github.com/vim-scripts/ctags.vim.git' ,
         'gundo.vim' =>                'https://github.com/sjl/gundo.vim.git' ,
          'nerdtree' =>          'https://github.com/scrooloose/nerdtree.git' ,
          'supertab' =>            'https://github.com/ervandew/supertab.git' ,
    'vim-afterimage' =>         'https://github.com/tpope/vim-afterimage.git' ,
       'vim-endwise' =>            'https://github.com/tpope/vim-endwise.git' ,
           'vim-git' =>                'https://github.com/tpope/vim-git.git' ,
          'vim-rake' =>               'https://github.com/tpope/vim-rake.git' ,
         'vim-rspec' =>                'https://github.com/taq/vim-rspec.git' ,
      'vim-surround' =>           'https://github.com/tpope/vim-surround.git' ,
     'zencoding-vim' =>          'https://github.com/mattn/zencoding-vim.git' ,
       'taglist.vim' =>      'https://github.com/vim-scripts/taglist.vim.git' ,
           'ack.vim' =>              'https://github.com/mileszs/ack.vim.git' ,
    'vim-javascript' =>        'https://github.com/mephux/vim-javascript.git' ,
        'vim-ragtag' =>             'https://github.com/tpope/vim-ragtag.git' ,
        'vim-pastie' =>             'https://github.com/tpope/vim-pastie.git' ,
     'SingleCompile' =>    'https://github.com/vim-scripts/SingleCompile.git' ,
           'matchit' =>      'https://github.com/vim-scripts/matchit.zip.git' ,
          'vim-yard' =>          'https://github.com/postmodern/vim-yard.git' ,

  # Snipmate Deps

      'vim-snipmate' =>          'https://github.com/garbas/vim-snipmate.git' ,
          'tlib_vim' =>              'https://github.com/tomtom/tlib_vim.git' ,
'vim-addon-mw-utils' => 'https://github.com/MarcWeber/vim-addon-mw-utils.git' ,
 'snipmate-snippets' =>      'https://github.com/honza/snipmate-snippets.git'
}

# 
# Add Submodule
#
bundles.each do |name, path|
  `git submodule add #{path} vim/bundle/#{name}`
end
