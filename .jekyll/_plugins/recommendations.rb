require 'yaml'
require 'imdb_lists'
module Jekyll
  class RenderListTag < Liquid::Tag

    def initialize(tag_name, list, tokens)
      super
      @list = list.strip
    end

    def list_entries(list)
      file = YAML.load_file("_lists/#{list}.yml")
      output = []
      output << file.map {|x| "<li><a href='#{x["url"]}'>#{x["title"]}</a></li>" }
      output
    end

    def render(context)
      "<ul>#{list_entries(@list).join}</ul>"
    end
  end

  class RenderImdbTag < Liquid::Tag
    def initialize(tag_name, list, tokens)
      super
      @list = list.strip
    end

    def list_entries(list)
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
      output
    end

    def render(context)
      "<ul>#{list_entries(@list).join}</ul>"
    end
  end
end

Liquid::Template.register_tag('render_list', Jekyll::RenderListTag)
Liquid::Template.register_tag('render_imdb', Jekyll::RenderImdbTag)