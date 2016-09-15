module Section508
  module Helpers
    module TableHelper

      # <table>
      def didit_table_tag(*args, &block)
        content, options = content_tag_args(*args, &block)
        validate_attributes( tag: :table, options: options, attributes: [:id, :summary], for_508: true )
        caption = options.delete(:caption)
        content_tag( :table, options ) do
          concat( content_tag( :caption, caption ) ) if caption.present?
          concat( content )
        end
      end
      alias_method :table_tag_508, :didit_table_tag

      # <th>
      def didit_th_tag(*args, &block)
        content, options = content_tag_args(*args, &block)
        validate_attributes( tag: :th, options: options, attributes: [:scope], for_508: true )
        validate_content(tag: :th, content: content, for_508: true)
        content_tag( :th, options ) do
          concat( content )
        end
      end
      alias_method :th_tag_508, :didit_th_tag

    end
  end
end
