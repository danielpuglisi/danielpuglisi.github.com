require 'rubygems'
require 'rake'
require 'fileutils'
require 'Date'
require 'colored'

@base = ".jekyll"
# @categories = ["articles", "tech"]
@categories = ["articles", "music"]

task :new do
  no_op(ARGV[1..-1])            # call no_op method
  ARGV.shift                    # get rid of first argument
  layout = ARGV.shift || "post" # get layout of new post
  file = create_file(layout)    # create file
  sh "$EDITOR #{file}"              # open it with vim
end

def create_file(type)
  # Title and other informations
  title = ask_for_title
  link = ask_for_link if type == "link"
  quote = ask_for_quote if type == "quote"

  # Category of the article
  # category = ask_for_category unless type == "link" || type == "quote"
  category = ask_for_category
  if category.to_s.empty?
    category_dir = "articles"
  else
    category_dir = category
  end

  number = get_sort_number(file_date)

  # permalink = "/#{category_dir}/#{permalink_date}/#{title.slug}.html"
  permalink = "/articles/#{permalink_date}/#{title.slug}.html"
  filename = "#{file_date}-#{title.slug}.md"

  filepath = "#{@base}/blog/#{category_dir}/_posts/#{filename}"

  FileUtils.touch(filepath)

  open(filepath, 'a') do |f|
    f.puts "---"
    f.puts "layout: #{type}"
    f.puts "title: \"#{title}\""
    f.puts "category: #{category}" unless category.to_s.empty?
    f.puts "date: #{file_date} #{number}"
    f.puts "link: \"#{link}\"" if link
    f.puts "permalink: \"#{permalink}\""
    f.puts "---"
    f.puts "\n> #{quote}" if quote
  end

  # Output message
  puts "Created #{filepath}".green

  filepath
end

############################
# User interaction methods #
############################

def ask_for_title
  puts "What should we call this article?".yellow
  print "> "
  STDIN.gets.chomp
end

def ask_for_link
  puts "Link for the article?".yellow
  print "> "
  STDIN.gets.chomp
end

def ask_for_quote
  puts "Quote for the article?".yellow
  print "> "
  STDIN.gets.chomp
end

def ask_for_category
  puts "In which category shall I put that new masterpiece?".yellow
  print "> "
  STDIN.gets.chomp
end

#########################
# Date and meta methods #
#########################

def slug
  self.downcase.gsub(" ", "-").gsub(/[^0-9a-z\-]/, '')
end
public :slug

def file_date
  Date.today.strftime("%Y-%m-%d")
end

def permalink_date
  Date.today.strftime("%Y/%m/%d")
end

def get_sort_number(date)
  amount = 0
  @categories.each do |category|
    files = Dir.entries("#{@base}/blog/#{category}/_posts").select {|f| f.match /^#{date}/}
    amount += files.count
  end
  amount.to_s
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

namespace :generate do

  desc "generates static files in root dir"
  task :site do
    sh "rsync -rd --delete --exclude-from=.jekyll/root-files #{@base}/_site/* ."
  end

  desc "generates static movie list"
  task :movies do
    require 'imdb_lists'
    result = ImdbLists.fetch("http://www.imdb.com/list/aw8wqGRn0LI/")
    output = []
    result.movies.sort_by{|x| x.rating}.reverse.map do |movie|
      if movie.created_at + (2*7*24*60*60) > Time.now
        new = "<span class='new'>NEW</span>"
      else
        new = ""
      end
      output << "<li>#{new}<a href='#{movie.details}'>#{movie.title}</a></li>"
    end
    File.open(".jekyll/_recommendations/movies.html", "w") << output.join
  end

  desc "generates music lifeline"
  task :music do
    require 'lastfm'
    require 'active_support/all'
    lastfm = Lastfm.new("get your own", "mafafakaaa")
    weeklycharts = lastfm.user.get_weekly_chart_list("pulleasy")
    weeklycharts.each do |weekly_chart|
      charts = lastfm.user.get_weekly_track_chart(user: "pulleasy", from: weekly_chart["from"], to: weekly_chart["to"])
      p chart
    end
    # first_date = Date.strptime(lastfm.user.get_weekly_chart_list("pulleasy").first["from"], "%s").at_beginning_of_month
    # last_date = Date.strptime(lastfm.user.get_weekly_chart_list("pulleasy").last["to"], "%s").at_end_of_month
    # current_date = first_date
    # while current_date < last_date do
    #   chart = lastfm.user.get_weekly_track_chart(user: "pulleasy", from: current_date.to_time.to_i, to: current_date.at_end_of_month.to_time.to_i)
    #   p chart
    #   p current_date.to_time.to_i
    #   current_date = current_date.next_month
    # end
  end
end

desc "cleans up the root directory but doesn't touch the jekyll files"
task :cleanup do
  #TODO: write cleanup code
end

desc "Startup Jekyll & Compass"
task :start do
  sh "cd #{@base} && foreman start"
end

desc "open site in browser"
task :open do
  sh "open http://localhost:4000"
end

task :default => :start

# e.g. year = 01.01.2009
def generate_top_tracks(year)
  weeklycharts = lastfm.user.get_weekly_chart_list("pulleasy")
  weeklycharts.each do |weekly_chart|
    charts = []
    if weekly_chart["from"] > year.to_time.to_i && weekly_chart["to"] < year.next_year.to_time.to_i
      charts << weekly_chart
    end
  end
end
