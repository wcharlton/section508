# General (http://www.section508.va.gov/support/webdev/11_0b.asp)
# - HTML table and associated elements must be used to markup tables.
# - Data table row or column headers must be identified programmatically.
# - Complex data table data cells should be associated with headers programmatically.
# - Calendar/date pickers should be treated as data tables.
# - Layout tables must linearize properly (table contents are properly arrangement
#   in a single column when they are linearized).
# - Data table markup such as TH, caption, and summary should not appear in
#   layout tables.
# - Data headers are marked up appropriately with <th> and the scope attribute.
# - Data headers are not left blank.
# Complex Data Tables (http://www.section508.va.gov/support/webdev/11_3a.asp)
# - When scope (row|col) is used, all cells in that row or column are associated with the
#   header cell.
# - The data and header cell must be in the same row or column
# - In situations where sub headings only apply to certain cells in a column or
#   row, ids and headers must be used.
# - Each table header cell <th> must be assigned an unique id attribute. This
#   attribute is referenced by each data cell labeled by the header cell. The order
#   of ids in the headers attribute should be the order that the header cells should
#   be announced.
# Recommendations (http://www.section508.va.gov/support/webdev/11_3b.asp)
# - Scope should not be used together with id and headers. Each approach should
#   be used independently.


module Section508
  module Helpers
    module TableHelper

      # <table>
      def table_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        validate_attributes( tag: :table, options: options, attributes: [:id, :summary], for_508: true )
        caption = options.delete(:caption)
        content_tag( :table, options ) do
          concat( content_tag( :caption, caption ) ) if caption.present?
          concat( content )
        end
      end

      # <th>
      def th_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        validate_attributes( tag: :th, options: options, attributes: [:scope], for_508: true )
        validate_content(tag: :th, content: content, for_508: true)
        content_tag( :th, options ) do
          concat( content )
        end
      end

      # <td>
      def td_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        content_tag( :td, options ) do
          concat( content )
        end
      end

      # <tr>
      def tr_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        content_tag( :tr, options ) do
          concat( content )
        end
      end

      # <thead>
      def thead_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        content_tag( :thead, options ) do
          concat( content )
        end
      end

      # <tbody>
      def tbody_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        content_tag( :tbody, options ) do
          concat( content )
        end
      end

      # <tfooter>
      def tfooter_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        content_tag( :tfooter, options ) do
          concat( content )
        end
      end




    end
  end
end
