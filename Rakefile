require 'rake'

PATH = File.expand_path(File.dirname(__FILE__)) + '/'

IGNORE = [
  'Rakefile',
  'README.md',
  'bundle.rb',
  'vimux.png'
]

BUNDLES = {
<<<<<<< HEAD

  'vim-handlebars' => 'https://github.com/nono/vim-handlebars.git',
=======
  'vim-smartusline' => 'https://github.com/molok/vim-smartusline.git',
# 'vim-ruby-debugger' => 'https://github.com/astashov/vim-ruby-debugger.git',
>>>>>>> 3b81ecaceabd3a1e6319dcd48a2c252f69f40f8b
  'vim-bundler' => 'https://github.com/tpope/vim-bundler.git',
  'vim-buffergator' => 'https://github.com/jeetsukumaran/vim-buffergator.git',
  'delimitMate' => 'https://github.com/Raimondi/delimitMate.git',
  'nerdcommenter' => 'https://github.com/scrooloose/nerdcommenter.git',
  'vim-align' => 'https://github.com/tsaleh/vim-align.git',
  'vim-fugitive' => 'https://github.com/tpope/vim-fugitive.git',
  'vim-repeat' => 'https://github.com/tpope/vim-repeat.git',
  'vim-ruby' => 'https://github.com/vim-ruby/vim-ruby.git',
  'vim-rails' => 'https://github.com/tpope/vim-rails.git',
  'vim-unimpaired' => 'https://github.com/tpope/vim-unimpaired.git',
  'supertab' => 'https://github.com/ervandew/supertab.git',
# 'vim-neocomplcache' => 'https://github.com/Shougo/neocomplcache.git',
  'vim-endwise' => 'https://github.com/tpope/vim-endwise.git',
  'vim-git' => 'https://github.com/tpope/vim-git.git',
  'vim-rake' => 'https://github.com/tpope/vim-rake.git',
  'vim-rspec' => 'https://github.com/taq/vim-rspec.git',
  'vim-surround' => 'https://github.com/tpope/vim-surround.git',
  'zencoding-vim' => 'https://github.com/mattn/zencoding-vim.git',
  'ack.vim' => 'https://github.com/mileszs/ack.vim.git',

  # Javascript

  'vim-javascript' => 'https://github.com/mephux/vim-javascript.git',
  'nodejs' => 'https://github.com/mmalecki/vim-node.js',

  'vim-ragtag' => 'https://github.com/tpope/vim-ragtag.git',
  'SingleCompile' => 'https://github.com/vim-scripts/SingleCompile.git',
  'vim-extradite' => 'https://github.com/int3/vim-extradite.git',
  'yankring' => 'https://github.com/vim-scripts/YankRing.vim.git',

  'vim-pasta' => 'https://github.com/sickill/vim-pasta.git',
  'nerdtree' => 'https://github.com/scrooloose/nerdtree.git',
  'greplace' => 'https://github.com/vim-scripts/greplace.vim.git',
  'ctrlp' => 'https://github.com/kien/ctrlp.vim.git',

  # Snipmate Deps

  'vim-snipmate' => 'git://github.com/garbas/vim-snipmate.git',
  'tlib_vim' => 'https://github.com/tomtom/tlib_vim.git',
  'vim-addon-mw-utils' => 'https://github.com/MarcWeber/vim-addon-mw-utils.git',
  'snipmate-snippets' => 'https://github.com/mephux/snipmate-snippets.git'

}

desc "Clean"
task :clean do
  items = BUNDLES.keys
  items.each do |item|
    puts "Removed vim/bundle/#{item}"
    `git rm -rf --cached vim/bundle/#{item} > /dev/null 2>&1`
    `git config --remove-section submodule.vim/bundle/#{item} > /dev/null 2>&1`
    `rm -rf vim/bundle/#{item} > /dev/null 2>&1`
  end
end

desc "Install Vimux"
task :install do
  Rake::Task["bundle"].invoke
  
  puts "\n"
  Rake::Task["update"].invoke

  puts "\n"
  Rake::Task["link"].invoke
end

desc "Link Vim configs to home dir"
task :link do

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

  puts "[~] Updating Vim plugins"

  items('vim/bundle/*') do |name, path|
    Dir.chdir(path)
    puts "[OK] #{name}"
    `git pull origin master` # > /dev/null 2>&1` 
    puts "\n"
  end

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
    `git submodule add -f #{path} vim/bundle/#{name} > /dev/null 2>&1`
    puts "[OK] #{name}"
  end

  puts "\n"
end
