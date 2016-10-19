# http://www.section508.va.gov/support/webdev/6_4.asp
# Section 508 Requirments - IMAGES
# - All images that require text equivalents have appropriate alternative text.
#   These types of images include text rendered as an image and images rendered
#   through AJAX, applets, or plug-ins.
# - Alt text for images is provided with the alt attribute.
# - Alt text for image links is provided on the alt attribute of the image
#   within the link.
# - Alt text for images that change state are accurate for each state of the
#   image.
# - Empty (null) alt="" attributes are properly assigned to images that do not
#   convey meaning, such as spacers, lines and images used only for decorative
#   purposes.
# - Each alert sound has a text alternative associated with it.
# - When instances of the same image are used multiple times, the meaning of
#   the image is consistent throughout the application, and conveyed through
#   visual appearance as well as descriptive text.
# - Each non-logo image whose primary purpose is to convey text is provided as
#   text.
# - Each CAPTCHA descriptive text contains the purpose of the CAPTCHA.
# - Image meaning and alternative text is consistently used.
# - Images that require a long description have short descriptive alt text and
#   a long description provided.
# - A summary of a chart or graph is provided in text when it can be understood
#   visually.
# - Decorative images do not contain descriptive alt text.
# - Background images are not used to convey meaning.
module Section508
  module Helpers
    module MediaHelper

      def audio_types
        ['audio/mpeg', 'audio/ogg', 'audio/wav']
      end

      def video_types
        ['video/mp4', 'video/webm', 'video/ogg']
      end

      def media_types
        audio_types + video_types
      end

      def track_types
        %w(captions chapters descriptions metadata subtitles)
      end


      def audio_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        validate_attributes( tag: :audio, options: options, attributes: [:id, :title], for_508: false )
        if ! contains_tag(contains: :source, content: content)
          validate_attributes( tag: :audio, options: options, attributes: [:src, :type], for_508: false )
          attribute_fail(tag: :source, attribute: :type, message: 'INVALID AUDIO TYPE') unless audio_types.include? options[:type]
        end
        content_tag( :audio, options ) do
          concat( content )
        end
      end


      def video_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        validate_attributes( tag: :audio, options: options, attributes: [:id, :title], for_508: false )
        if ! contains_tag(contains: :source, content: content)
          validate_attributes( tag: :video, options: options, attributes: [:src, :type], for_508: false )
          attribute_fail(tag: :source, attribute: :type, message: 'INVALID VIDEO TYPE') unless video_types.include? options[:type]
        end
        content_tag( :video, options ) do
          concat( content )
        end
      end

      def source_tag_508(options = {})
        validate_attributes( tag: :source, options: options, attributes: [:src, :type], for_508: true )
        attribute_fail(tag: :source, attribute: :type, message: 'INVALID AUDIO/VIDEO TYPE') unless media_types.include? options[:type]
        tag(:source, options)
      end

      def video_source_tag_508(options = {})
        validate_attributes( tag: :source, options: options, attributes: [:src, :type], for_508: true )
        attribute_fail(tag: :source, attribute: :type, message: 'INVALID AUDIO/VIDEO TYPE') unless video_types.include? options[:type]
        tag(:source, options)
      end

      def audio_source_tag_508(options = {})
        validate_attributes( tag: :source, options: options, attributes: [:src, :type], for_508: true )
        attribute_fail(tag: :source, attribute: :type, message: 'INVALID AUDIO/VIDEO TYPE') unless audio_types.include? options[:type]
        tag(:source, options)
      end

      def track_tag_508(options = {})
        validate_attributes( tag: :track, options: options, attributes: [:src, :kind], for_508: false )
        validate_attributes( tag: :track, options: options, attributes: [:label], for_508: true )
        attribute_fail(tag: :track, attribute: :kind, message: 'INVALID TRACK KIND') unless track_types.include? options[:kind]
        tag(:track, options)
      end

    end
  end
end
