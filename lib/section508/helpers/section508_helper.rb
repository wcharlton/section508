module Section508
  module Helpers
    module Section508Helper

      def content_tag_args(*args, &block)
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


      def validate_attributes(tag: :div, options: {}, attributes: [], for_508: false)
        attributes.each do |attribute|
          if for_508
            attribute_fail_508({tag: tag, attribute: attribute}) unless options[attribute.to_sym].present?
          else
            attribute_fail({tag: tag, attribute: attribute}) unless options[attribute.to_sym].present?
          end
        end
      end

      def validate_content(tag: :div, content: :content, for_508: false)
        # raise content
        if content.blank?
          for_508 ? content_fail_508(:tag) : content_fail(:tag)
        end
      end

      def attribute_fail_508(tag: :div, attribute: :alt)
        raise "<#{tag}> requires '#{attribute}' attribute for 508 compliance"
      end

      def attribute_fail(tag: :div, attribute: :alt)
        raise "<#{tag}> requires '#{attribute}' attribute to be valid or complete"
      end

      def content_fail_508(tag: :div)
        raise "<#{tag}> requires content for 508 compliance"
      end

      def content_fail(tag: :div)
        raise "<#{tag}> requires content to be valid or complete"
      end

    end
  end
end
