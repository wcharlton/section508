module Section508
  module Helpers
    module FieldsetHelper

      def fieldset_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        if options[:legend].present?
          content = "#{legend_tag_508(options[:legend])}#{content}"
        end
        validate_content_contains( tag: :fieldset, content: content, contains: :legend)
        content_tag( :fieldset, options ) do
          concat( content.html_safe )
        end
      end

      def legend_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :legend, options ) do
          concat( content.html_safe )
        end
      end

    end
  end
end
