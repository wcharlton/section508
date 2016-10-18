module Section508
  module Helpers
    module LinkToHelper

      def link_to_508(content = nil, href = nil, options = nil,  &block)
        href, options, content = content, href, capture(&block).html_safe  if block_given?
        options ||= {}

        begin
          validate_attributes( tag: :a, options: options, attributes: [:alt, :title], for_508: true )
        rescue Exception => e
          raise e
        end

        link_to(content, href, options)
      end


    end
  end
end
