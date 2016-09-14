module Section508
  module Helpers
    module ImageHelper

      def didit_image_tag(source, options={})
        raise 'alt attribute is required for 508 complience' unless options[:alt].present?
        raise 'title attribute is required for 508 complience' unless options[:title].present?
        image_tag(source, options)
      end
      alias_method :image_tag_508, :didit_image_tag

    end
  end
end
