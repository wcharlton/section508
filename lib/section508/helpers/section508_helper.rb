module Section508
  module Helpers
    module Section508Helper

      # def content_tag_args_deprecated(*args, &block)
      #   options = {}
      #   if block_given?
      #     content = capture(&block)
      #     options = options.merge(args[0]) if args.size > 0
      #   else
      #     raise ArgumentError, "Missing parameters -2" if args.length < 1
      #     content = args[0]
      #     options = options.merge(args[1]) if args.size > 1
      #   end
      #   return content, options
      # end
      #
      # def content_tag_args(content = nil, options = nil, &block)
      #   options, content = capture(&content), block if block_given?
      #   options ||= {}
      #   return content, options
      # end


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
        if content.blank?
          for_508 ? content_fail_508(:tag) : content_fail(:tag)
        end
        true
      end

      def validate_content_contains(tag: :div, content: :content, for_508: false, contains: :something)
        if ! contains_content_tag(contains: contains, content: content)
          for_508 ? content_contains_fail_508(tag: tag, contains: contains) : content_contains_fail(tag: tag, contains: contains)
        end
      end

      alias_method :validate_contains_content_tag, :validate_content_contains

      def validate_contains_tag(tag: :img, content: :content, for_508: false, contains: :something)
        if ! contains_tag(contains: contains, content: content)
          for_508 ? content_contains_fail_508(tag: tag, contains: contains) : content_contains_fail(tag: tag, contains: contains)
        end
      end


      def contains_tag(contains: :something, content: :content)
        pattern = "<#{Regexp.quote(contains.to_s)}.*>"
        Regexp.new(/#{pattern}/im).match(content)
      end

      def contains_content_tag(contains: :something, content: :content)
        pattern = "<#{Regexp.quote(contains.to_s)}.*>.*\\S+.*<\/#{Regexp.quote(contains.to_s)}>"
        comment_pattern = "<!--.*<#{Regexp.quote(contains.to_s)}.*>.*\\S+.*<\/#{Regexp.quote(contains.to_s)}>.*-->"
        Regexp.new(/#{pattern}/im).match(content) || Regexp.new(/#{comment_pattern}/im).match(content)
      end


      def attribute_fail_508(tag: :div, attribute: :alt, message: '')
        message = "<#{tag}> requires '#{attribute}' attribute for 508 compliance\n #{message}"
        raise Section508AttributeException, message
      end

      def attribute_fail(tag: :div, attribute: :alt, message: '')
        message = "<#{tag}> requires '#{attribute}' attribute to be valid or complete\n #{message}"
        raise Section508AttributeException, message
      end

      def content_fail_508(tag: :div, message: '')
        message = "<#{tag}> requires content for 508 compliance\n #{message}"
        raise Section508ContentException, message
      end

      def content_contains_fail_508(tag: :div, contains: 'something', message: '')
        message = "<#{tag}> requires content to contain <#{contains}> for 508 compliance\n #{message}"
        raise Section508ContentException, message
      end

      def content_fail(tag: :div, message: '')
        message = "<#{tag}> requires content to be valid or complete\n #{message}"
        raise Section508ContentException, message
      end

      def content_contains_fail(tag: :div, contains: 'something', message: '' )
        message = "<#{tag}> requires content to contain <#{contains}> to be valid or complete\n #{message}"
        raise Section508ContentException, message
      end

      def deprecated_fail(tag: :big, message: '')
        message = "<#{tag}> is deprecated\n #{message}"
        raise Section508TagDeprecationException, message
      end


    end
  end
end
