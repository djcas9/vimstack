require 'rake'

PATH = File.expand_path(File.dirname(__FILE__)) + '/'

IGNORE = [
  'Rakefile',
  'README.md',
  'bundle.rb',
  'vimux.png'
]

desc "install the dot files into user's home directory"
task :install do

  items do |name, path|
    next if IGNORE.include?(name)
    drop(name)
  end

end

desc "replace all vim configs"
task :vim do

  items do |name, path|
    next unless name.match(/vim/)
    drop(name, true)
  end

end

desc "Update Vim Plugins"
task :update do

  items('vim/bundle/*') do |name, path|
    Dir.chdir(path)
    STDOUT.puts "Checking for #{name} updates"
    `git pull origin master`
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
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end
