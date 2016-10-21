module Section508
  module Helpers
    module ListHelper

      # <ul> Defines an unordered list
      def ul_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :ul, options ) do
          concat( content )
        end
      end

      # <ol> Defines an ordered list
      def ol_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :ol, options ) do
          concat( content )
        end
      end


      # <li> Defines a list item
      def li_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :li, options ) do
          concat( content )
        end
      end


      # <dir> Not supported in HTML5. Use <ul> instead. Defines a directory list
      def dir_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :dir, message: 'Not supported in HTML5. Use <ul> instead. Defines a directory list') unless options[:override_deprecation]
        content_tag( :dir, options ) do
          concat( content )
        end
      end


      # <dl> Defines a description list
      def dl_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :dl, options ) do
          concat( content )
        end
      end

      # <dt> Defines a term/name in a description list
      def dt_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :dt, options ) do
          concat( content )
        end
      end

      # <dd> Defines a description of a term/name in a description list
      def dd_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :dd, options ) do
          concat( content )
        end
      end

      # <menu>     Defines a list/menu of commands
      def menu_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        support_fail(tag: :menu) unless options[:override_support]
        content_tag( :menu, options ) do
          concat( content )
        end
      end

      # <menuitem> Defines a command/menu item that the user can invoke from a popup menu
      def menuitem_tag_508(options = {})
        types = %w(list toolbar context)
        validate_attributes( tag: :menuitem, options: options, attributes: [:label, :type], for_508: false )
        attribute_fail(tag: :menuitem, attribute: :type, message: "INVALID LIST TYPE | VALID TYPES: #{types.join(', ')}") unless types.include? options[:type]
        support_fail(tag: :menuitem) unless options[:override_support]
        tag( :menuitem, options )
      end


    end
  end
end
