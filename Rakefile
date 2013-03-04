require 'rake'

PATH = File.expand_path(File.dirname(__FILE__)) + '/'

IGNORE = [
  'Rakefile',
  'README.md',
  'bundle.rb',
  'vimux.png'
]

#
# Make sure pathogen is install
#
PATHOGEN = %{ mkdir -p ~/.vim/autoload ~/.vim/bundle; 
              curl -so ~/.vim/autoload/pathogen.vim \
              https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim 
            }

BUNDLES = {

  # eunuch.vim: helpers for UNIX
  'vim-eunuch' => 'https://github.com/tpope/vim-eunuch.git',

  'vim-bro' => 'https://github.com/mephux/bro.vim.git',
  # 'vim-pasta' => 'https://github.com/sickill/vim-pasta.git',
  
  'vim-handlebars'      => 'https://github.com/nono/vim-handlebars.git',
  'vim-smartusline'     => 'https://github.com/molok/vim-smartusline.git',
  'vim-buffergator'     => 'https://github.com/jeetsukumaran/vim-buffergator.git',
  'vim-smartinput'      => 'https://github.com/kana/vim-smartinput.git',
  'nerdcommenter'       => 'https://github.com/scrooloose/nerdcommenter.git',
  'vim-align'           => 'https://github.com/tsaleh/vim-align.git',
  'vim-fugitive'        => 'https://github.com/tpope/vim-fugitive.git',
  'vim-repeat'          => 'https://github.com/tpope/vim-repeat.git',
  'vim-ruby'            => 'https://github.com/vim-ruby/vim-ruby.git',
  'vim-unimpaired'      => 'https://github.com/tpope/vim-unimpaired.git',
  'supertab'            => 'https://github.com/ervandew/supertab.git',
  'vim-endwise'         => 'https://github.com/tpope/vim-endwise.git',
  'vim-git'             => 'https://github.com/tpope/vim-git.git',
  'vim-rake'            => 'https://github.com/tpope/vim-rake.git',
  'vim-rspec'           => 'https://github.com/taq/vim-rspec.git',
  'vim-surround'        => 'https://github.com/tpope/vim-surround.git',
  'zencoding-vim'       => 'https://github.com/mattn/zencoding-vim.git',
  'ack.vim'             => 'https://github.com/mileszs/ack.vim.git',

  # Javascript
  'vim-javascript'      => 'https://github.com/mephux/vim-javascript.git',
  'nodejs'              => 'https://github.com/mmalecki/vim-node.js',
  'vim-go'              => 'https://github.com/uggedal/go-vim.git',

  # Other
  'vim-ragtag'          => 'https://github.com/tpope/vim-ragtag.git',
  'SingleCompile'       => 'https://github.com/vim-scripts/SingleCompile.git',
  'vim-extradite'       => 'https://github.com/int3/vim-extradite.git',
  'greplace'            => 'https://github.com/vim-scripts/greplace.vim.git',
  'ctrlp'               => 'https://github.com/kien/ctrlp.vim.git',

  # Snipmate Deps
  'vim-snipmate'        => 'git://github.com/garbas/vim-snipmate.git',
  'tlib_vim'            => 'https://github.com/tomtom/tlib_vim.git',
  'vim-addon-mw-utils'  => 'https://github.com/MarcWeber/vim-addon-mw-utils.git',
  'snipmate-snippets'   => 'https://github.com/mephux/snipmate-snippets.git',
  'nerdtree'            => 'https://github.com/scrooloose/nerdtree.git'
}

def current_submodules
  unless @modules
    @modules = []
    data = `git submodule`
    data.each_line do |line|
      r = line.split(' ')
      @modules.push(r[1])  
    end
  end

  @modules
end

def diff_submodule
  current_submodules.map { |x| x.split('/')[2] } - BUNDLES.keys
end

desc "Clean"
task :clean do

  puts "Removing old vim configs"
  `rm -rf ~/.vim*`
  `rm -rf ~/.gvim*`

  items = current_submodules
  items.each do |item|
    `git rm --cached --ignore-unmatch -f #{item}`
    `git config -f .git/config --remove-section submodule.#{item}`
    `git config -f .gitmodules --remove-section submodule.#{item}`
    `rm -rf #{item}` #> /dev/null 2>&1`
  end
end

desc "Install Vimux"
task :install do

  # Clean
  Rake::Task["clean"].invoke

  # Install
  Rake::Task["bundle"].invoke

  # Install Pathogen
  system PATHOGEN

  # system "git submodule sync > /dev/null 2>&1"

  puts "\n"

  # Link Files
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
  `git submodule init`
  `git submodule update`
end

desc "[OLD] Update Vim Plugins"
task :update_old do

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
 puts "\n[~] Updating Submodule Index"

  # Add Submodule
  BUNDLES.each do |name, path|
    `git submodule add #{path} vim/bundle/#{name} --force` # > /dev/null 2>&1`
    `cd vim/bundle/#{name} && git pull --force`
    puts "[OK] #{name}"
  end

  puts "\n"
end
