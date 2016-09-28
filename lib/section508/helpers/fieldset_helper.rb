module Section508
  module Helpers
    module FieldsetHelper

      def fieldset_tag_508(*args, &block)
        content, options = content_tag_args(*args, &block)

        if options[:legend].present?
          content = "#{legend_tag_508(options[:legend])}#{content}"
        end

        # binding.pry

        validate_content_contains( tag: :fieldset, content: content, contains: :legend)
        content_tag( :fieldset, options ) do
          concat( content.html_safe )
        end
      end

      def legend_tag_508(*args, &block)
        content, options = content_tag_args(*args, &block)
        content_tag( :legend, options ) do
          concat( content.html_safe )
        end
      end

    end
  end
end
