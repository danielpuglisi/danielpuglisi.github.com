require 'yaml'
module Jekyll
  # class RenderListTag < Liquid::Tag

  #   def initialize(tag_name, list, tokens)
  #     super
  #     @list = list.strip
  #   end

  #   def list_entries(list)
  #     file = YAML.load_file("_lists/#{list}.yml")
  #     output = []
  #     output << file.map {|x| "<li><a href='#{x["url"]}'>#{x["title"]}</a></li>" }
  #     output
  #   end

  #   def render(context)
  #     "<ul>#{list_entries(@list).join}</ul>"
  #   end
  # end

  class RenderImdbTag < Liquid::Tag
    def initialize(tag_name, list, tokens)
      super
      @list = list.strip
    end

    def list_entries(list)
      File.read("_recommendations/movies.html")
    end

    def render(context)
      "<ul>#{list_entries(@list)}</ul>"
    end
  end
end

# Liquid::Template.register_tag('render_list', Jekyll::RenderListTag)
Liquid::Template.register_tag('render_imdb', Jekyll::RenderImdbTag)
