require 'rake'

PATH = File.expand_path(File.dirname(__FILE__)) + '/'

IGNORE = [
  'Rakefile',
  'README.md',
  'bundle.rb',
  'vimux.png'
]

BUNDLES = {
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

desc "install the dot files into user's home directory"
task :install do

  items do |name, path|
    next if IGNORE.include?(name)
    drop(name)
  end

end

desc "replace all vim configs"
task :vim do

  puts "[~] Linking Vim files"
  Dir.chdir(PATH)

  items do |name, path|
    next if IGNORE.include?(name)
    next unless name.match(/vim/)
    drop(name, true)
  end

end

desc "Bundle Submodules"
task :bundle do
  bundle
end

desc "Update Vim Plugins"
task :update do
  
  Rake::Task["bundle"].invoke

  puts "[~] Updating Submodules"

  items('vim/bundle/*') do |name, path|
    Dir.chdir(path)
    puts "[OK] #{name}"
    `git pull origin master > /dev/null 2>&1` 
  end

  puts "\n"

  Rake::Task["vim"].invoke
end

# Helpers
def items(path='*', &block)
  files = []

  Dir[path].each do |item|
    files.push(item)

    path = PATH.to_s + item.to_s
    block.call(item, path) if block
  end

  files
end

def drop(file, replace=false)
  if File.exist?(File.join(ENV['HOME'], ".#{file}"))
    if replace
      replace_file(file)
    else
      print "overwrite ~/.#{file}? [ynaq] "
      case $stdin.gets.chomp
      when 'a'
        replace = true
        replace_file(file)
      when 'y'
        replace_file(file)
      when 'q'
        exit
      else
        puts "skipping ~/.#{file}"
      end
    end
  else
    link_file(file)
  end
end

def replace_file(file)
  system %Q{rm -rf "$HOME/.#{file}"}
  link_file(file)
end

def link_file(file)
  puts "[OK] ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def bundle
  #Dir.chdir(PATH)

  puts "\n[~] Updating Submodule Index"

  # 
  # Add Submodule
  #
  BUNDLES.each do |name, path|
    `git submodule add #{path} vim/bundle/#{name} > /dev/null 2>&1`
    puts "[OK] #{name}"
  end

  puts "\n"
end

