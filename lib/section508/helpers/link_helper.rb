module Section508
  module Helpers
    module LinkHelper


      # <a>  Defines a hyperlink
      def link_to_508(content = nil, href = nil, options = nil,  &block)
        href, options, content = content, href, capture(&block).to_s.html_safe  if block_given?
        options ||= {}
        begin
          validate_attributes( tag: :a, options: options, attributes: [:alt, :title], for_508: true )
        rescue Exception => e
          raise e
        end
        link_to(content, href, options)
      end

      def a_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block) if block_given?
        # raise options.to_json.to_s
        # content = (content.nil?) ? '' : content
        options ||= {}
        validate_attributes( tag: :a, options: options, attributes: [:alt, :title], for_508: true ) if options[:href].present?
        validate_attributes( tag: :a, options: options, attributes: [:id], for_508: false ) unless options[:href].present?
        content_tag( :a, options ) do
          concat( content )
        end
      end

      # <link>     Defines the relationship between a document and an external resource (most used to link to style sheets)
      def link_tag_508(options = {})
        validate_attributes( tag: :link, options: options, attributes: [:rel], for_508: false )
        tag( options )
      end

      # <nav> Defines navigation links
      def nav_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :nav, options ) do
          concat( content )
        end
      end


    end
  end
end
