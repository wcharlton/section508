module Section508
  module Helpers
    module TableHelper


      def didit_table_tag(*args, &block)
        content, options = helper_args(*args, &block)
        raise 'summary attribute is required for <table> 508 complience' unless options[:summary].present?
        raise 'id attribute is required for <table> 508 complience' unless options[:id].present?
        caption = options.delete(:caption)
        content_tag( 'table', options ) do
          concat( content_tag( 'caption', caption ) ) if caption.present?
          concat( content )
        end
      end
      alias_method :table_tag_508, :didit_table_tag

      def didit_th_tag(*args, &block)
        content, options = helper_args(*args, &block)
        raise 'scope attribute is required for 508 complience' unless options[:scope].present?
        content_tag( 'th', options ) do
          concat( content )
        end
      end
      alias_method :th_tag_508, :didit_th_tag


      private

      def helper_args(*args, &block)
        options = {}
        if block_given?
          content = capture(&block)
          options = options.merge(args[0]) if args.size > 0
        else
          raise ArgumentError, "Missing parameters -2" if args.length < 1
          content = args[0]
          options = options.merge(args[1]) if args.size > 1
        end
        return content, options
      end

    end
  end
end
