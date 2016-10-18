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
    module ImageHelper

      def image_tag_508(source, options={})
        validate_attributes( tag: :img, options: options, attributes: [:alt, :title], for_508: true )
        image_tag(source, options)
      end

      def map_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        validate_attributes( tag: :map, options: options, attributes: [:name], for_508: true )
        content_tag( :map, options ) do
          concat( content )
        end
      end

      def area_tag_508(options={})
        validate_attributes( tag: :area, options: options, attributes: [:shape, :coords, :href], for_508: false )
        validate_attributes( tag: :area, options: options, attributes: [:alt], for_508: true )
        tag(:area, options)
      end

    end
  end
end
