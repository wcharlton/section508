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

      # <audio>    Defines sound content
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

      # <video>    Defines a video or movie
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

      # <source>   Defines multiple media resources for media elements (<video> and <audio>)
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

      # <track>    Defines text tracks for media elements (<video> and <audio>)
      def track_tag_508(options = {})
        validate_attributes( tag: :track, options: options, attributes: [:src, :kind], for_508: false )
        validate_attributes( tag: :track, options: options, attributes: [:label], for_508: true )
        attribute_fail(tag: :track, attribute: :kind, message: 'INVALID TRACK KIND') unless track_types.include? options[:kind]
        tag(:track, options)
      end

    end
  end
end
