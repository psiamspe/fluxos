require 'open-uri'
require 'uri'

module Jekyll
  class ReferencesTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @title = text
    end

    def reference(style, ref)
      # Initialize return reference
      final_reference = ''

      # Parse article data according to style
      case style
      when 'apa', 'american psychological association'
        # Parse authors
        if ref["organization"].to_s != ''
          # If organization, use full name
          final_reference = ref["organization"].to_s + "."
        else
          # Otherwise, use APA abbreviations
          ref["authors"].map! do |author|
            author = author.split
            last_name = author.pop
            fist_names = author.map do |n|
              n[0].upcase + "."
            end
            fist_names = fist_names.join
            author = last_name + " " + fist_names

            author
          end
          final_reference = ref["authors"].join(', ') + "."
        end
        # Parse publication date
        if ref["publication"] != ''
          final_reference += " (" + ref["publication"].to_s + ")."
        end
        # Parse article title
        final_reference += " " + ref["title"] + "."
        # If published in a journal
        if ref["journal"].to_s != ''
          # Parse journal
          final_reference += " " + ref["journal"]
          # Parse volume and issue
          if ref["volume"].to_s != '' and ref["issue"].to_s != ''
            final_reference += ", " + ref["volume"].to_s + "(" + ref["issue"].to_s + ")"
          elsif ref["volume"].to_s != ''
            final_reference += ", " + ref["volume"].to_s
          end
          # Parse pages
          if ref["pages"].to_s != ''
            final_reference += ", " + ref["pages"].to_s
          end
        end
        final_reference += "."
        final_reference.gsub!("..", ".")
      when 'mla', 'modern language association'
        # TODO: Continue here!
        # https://pitt.libguides.com/citationhelp/mla9thedition
      when 'chicago', 'turabian', 'chicago/turabian'
        #
      when 'ieee', 'institute of electrical and electronics engineers'
        #
      else # Vancouver, the default
        #
      end

      # Return parsed reference
      final_reference
    end

    def parse_ref(ref, ref_style)
      # Initialize return reference
      final_reference = ""

      if ref["doi"]
        # If there is a DOI set, retrieve data from it
        URI.open("https://doi.org/" + ref["doi"].to_s, 'Accept' => "text/bibliography; style=#{ref_style}") do |f|
          f.each do |line|
            final_reference = line
            final_reference.gsub!(/^\d+\./, '')
            final_reference.gsub!(/Available from: (.+)/, 'Disponível <a href="\1" targer="_blank">aqui</a>.')
          end
        end
      else
        # If there isn't a DOI, mount it from metadata
        final_reference = reference('apa', ref)
      end

      # Return parsed reference
      final_reference
    end

    def render(context)
      # Retrieve references from page
      refs = context.registers[:page]["references"]
      # Retrieve references style
      ref_style = context.registers[:site].config["references"]["style"].downcase

      # Build output
      output = "<h2>#{@title}</h2>\n"
      output += "<ol>\n"
      refs.each do |r|
        output += "<li>#{parse_ref(r[1], ref_style)}</li>\n"
      end
      output += "</ol>"
      # Return output
      output
    end
  end
end

Liquid::Template.register_tag('references', Jekyll::ReferencesTag)