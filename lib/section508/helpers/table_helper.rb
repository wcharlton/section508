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

      # <table>    Defines a table
      def table_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        validate_attributes( tag: :table, options: options, attributes: [:id, :summary], for_508: true )
        caption = options.delete(:caption)
        content_tag( :table, options ) do
          concat( content_tag( :caption, caption ) ) if caption.present?
          concat( content )
        end
      end

      # <th> Defines a header cell in a table
      def th_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        validate_attributes( tag: :th, options: options, attributes: [:scope], for_508: true )
        validate_content(tag: :th, content: content, for_508: true)
        content_tag( :th, options ) do
          concat( content )
        end
      end

      # <td> Defines a cell in a table
      def td_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :td, options ) do
          concat( content )
        end
      end

      # <tr> Defines a row in a table
      def tr_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :tr, options ) do
          concat( content )
        end
      end

      # <thead>    Groups the header content in a table
      def thead_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :thead, options ) do
          concat( content )
        end
      end

      # <tbody>    Groups the body content in a table
      def tbody_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :tbody, options ) do
          concat( content )
        end
      end

      # <tfoot>    Groups the footer content in a table
      def tfoot_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :tfoot, options ) do
          concat( content )
        end
      end

      # <caption>  Defines a table caption
      def caption_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :caption, options ) do
          concat( content )
        end
      end


      # <col> Specifies column properties for each column within a <colgroup> element
      def col_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :col, options ) do
          concat( content )
        end
      end


      # <colgroup> Specifies a group of one or more columns in a table for formatting
      def colgroup_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        content_tag( :colgroup, options ) do
          concat( content )
        end
      end




    end
  end
end
