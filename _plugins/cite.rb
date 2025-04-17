# frozen_string_literal: true

require 'jekyll'

module Jekyll
  class CiteTag < Liquid::Tag
    def initialize(tag_name, text, tokens)
      super
      @ref = text
      @ref.strip!
    end

    def render(context)
      # Retrieve references from page
      refs = context.registers[:page]["references"]
      # Parse references to contain only the IDs
      new_refs = []
      refs.each_with_index { |ref, i| new_refs[i] = ref[0] }
      refs = new_refs

      # Build output
      output = ''
      # Check if index exists
      if refs.index(@ref).nil?
        # If it does not exist, set to question mark with no link
        output = '<sup>?</sup>'
      else
        # If it does exist
        output = "<sup><a href=\"#ref-#{@ref}\">#{refs.index(@ref) + 1}</a></sup>"
      end

      # Return output
      output
    end
  end
end

Liquid::Template.register_tag('cite', Jekyll::CiteTag)
