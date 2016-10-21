module Section508
  module Helpers
    module FrameHelper

      # <frame>    Not supported in HTML5. Defines a window (a frame) in a frameset
      def frame_tag_508(options = {})
        deprecated_fail(tag: :frame, message: 'Not supported in HTML5.') unless options[:override_deprecation]
        validate_attributes( tag: :iframe, options: options, attributes: [:src], for_508: false )
        tag( :frame, options )
      end


      # <frameset> Not supported in HTML5. Defines a set of frames
      def frameset_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :frameset, message: 'Not supported in HTML5.') unless options[:override_deprecation]
        content_tag( :frameset, options ) do
          concat( content )
        end
      end


      # <noframes> Not supported in HTML5. Defines an alternate content for users that do not support frames
      def noframes_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :noframes, message: 'Not supported in HTML5.') unless options[:override_deprecation]
        content_tag( :noframes, options ) do
          concat( content )
        end
      end


      # <iframe>   Defines an inline frame
      def iframe_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        validate_attributes( tag: :iframe, options: options, attributes: [:src], for_508: false )
        content_tag( :iframe, options ) do
          concat( content )
        end
      end




    end
  end
end
