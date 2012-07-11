require 'rubygems'
require 'rake'
require 'fileutils'
require 'Date'

base = ".jekyll"

task :new do
  no_op(ARGV[1..-1])            # call no_op method
  ARGV.shift                    # get rid of first argument
  layout = ARGV.shift || "post" # get layout of new post
  file = create_file(layout)           # create file
  sh "vim #{file}"
end

def create_file(type)
  title = ask_for_title
  link = ask_for_link if type == "link"
  date = get_date
  number = get_sort_number(date)

  filepath = "#{base}/_posts/#{date}-#{title.slug}.md"

  FileUtils.touch(filepath)

  open(filepath, 'a') do |f|
    f.puts "---"
    f.puts "layout: #{type}"
    f.puts "title: \"#{title}\""
    f.puts "date: #{date} #{number}"
    f.puts "link: \"#{link}\"" if link
    f.puts "---"
  end
  filepath
end

############################
# User interaction methods #
############################

def ask_for_title
  puts "What should we call this article?"
  print "> "
  STDIN.gets.chomp
end

def ask_for_link
  puts "Link for the article?"
  print "> "
  STDIN.gets.chomp
end

#########################
# Date and meta methods #
#########################

def slug
  self.downcase.gsub(" ", "-").strip
end
public :slug

def get_date
  Date.today.strftime("%Y-%m-%d")
end

def get_sort_number(date)
  files = Dir.entries("#{base}/_posts").select {|f| f.match /^#{date}/}
  files.empty? ? "0" : files.count.to_s
end

# creates no operation tasks for
# the command line arguments
def no_op(args)
  args.each { |a| task a.to_sym do ; end }
end

namespace :list do
  desc "Show published articles"
  task :published do

  end

  desc "Show unpublished articles"
  task :unpublished do
  end
end

desc "generates static files in root dir"
task :generate do
  sh "rsync -rd #{base}/_site/* ."
end

desc "cleans up the root directory but doesn't touch the jekyll files"
task :cleanup do
  #TODO: write cleanup code
end

desc "Startup Jekyll & Compass"
task :start do
  sh "cd #{base} && foreman start"
end

task :default => :start
