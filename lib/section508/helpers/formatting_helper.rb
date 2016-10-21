module Section508
  module Helpers
    module FormattingHelper
      # <abbr>     Defines an abbreviation or an acronym
      def abbr_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :abbr, options ) do
          concat( content )
        end
      end

      # <acronym> Defines an acronym.  Not supported in HTML5. Use <abbr> instead.
      alias_method :acronym_tag_598, :abbr_tag_508

      # <address>  Defines contact information for the author/owner of a document/article
      def address_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :address, options ) do
          concat( content )
        end
      end

      # <bdi> Isolates a part of text that might be formatted in a different direction from other text outside it
      def bdi_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :bdi, options ) do
          concat( content )
        end
      end

      # <bdo> Overrides the current text direction
      def bdo_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :bdo, options ) do
          concat( content )
        end
      end

      # <big> Defines big text. Not supported in HTML5. Use CSS instead.
      def big_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :big) unless options[:override_deprecation]
        content_tag( :big, options ) do
          concat( content )
        end
      end

      # <blockquote>    Defines a section that is quoted from another source
      def blockquote_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :blockquote, options ) do
          concat( content )
        end
      end


      # <center> Defines centered text.  Not supported in HTML5. Use CSS instead.
      def center_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :center) unless options[:override_deprecation]
        content_tag( :center, options ) do
          concat( content )
        end
      end

      # <cite>     Defines the title of a work
      def cite_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :cite, options ) do
          concat( content )
        end
      end

      # <code>     Defines a piece of computer code
      def code_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :code, options ) do
          concat( content )
        end
      end

      # <del> Defines text that has been deleted from a document
      def del_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :del, options ) do
          concat( content )
        end
      end

      # <dfn> Represents the defining instance of a term
      def dfn_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :dfn, options ) do
          concat( content )
        end
      end

      # <em> Defines emphasized text
      def em_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :em, options ) do
          concat( content )
        end
      end

      # <font> Defines font, color, and size for text.    Not supported in HTML5. Use CSS instead.
      def font_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :font) unless options[:override_deprecation]
        content_tag( :font, options ) do
          concat( content )
        end
      end

      # <i>  Defines a part of text in an alternate voice or mood
      def i_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :i, options ) do
          concat( content )
        end
      end

      # <ins> Defines a text that has been inserted into a document
      def ins_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :ins, options ) do
          concat( content )
        end
      end

      # <kbd> Defines keyboard input
      def kbd_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :kbd, options ) do
          concat( content )
        end
      end

      # <mark>     Defines marked/highlighted text
      def mark_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :mark, options ) do
          concat( content )
        end
      end

      # <meter>    Defines a scalar measurement within a known range (a gauge)
      def meter_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        validate_attributes( tag: :meter, options: options, attributes: [:title], for_508: true )
        content_tag( :meter, options ) do
          concat( content )
        end
      end

      # <pre> Defines preformatted text
      def pre_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :pre, options ) do
          concat( content )
        end
      end


      # <progress> Represents the progress of a task
      def progress_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        validate_attributes( tag: :progress, options: options, attributes: [:title], for_508: true )
        content_tag( :progress, options ) do
          concat( content )
        end
      end

      # <q>  Defines a short quotation
      def q_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :q, options ) do
          concat( content )
        end
      end

      # <rp> Defines what to show in browsers that do not support ruby annotations
      def rp_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :rp, options ) do
          concat( content )
        end
      end


      # <rt> Defines an explanation/pronunciation of characters (for East Asian typography)
      def rt_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :rt, options ) do
          concat( content )
        end
      end


      # <ruby>     Defines a ruby annotation (for East Asian typography)
      def ruby_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :ruby, options ) do
          concat( content )
        end
      end

      # <s>  Defines text that is no longer correct
      def s_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :s, options ) do
          concat( content )
        end
      end

      # <samp>     Defines sample output from a computer program
      def samp_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :samp, options ) do
          concat( content )
        end
      end

      # <small>    Defines smaller text
      def small_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :small, options ) do
          concat( content )
        end
      end

      # <strike>  Defines strikethrough text.  Not supported in HTML5. Use <del> or <s> instead.
      alias_method :strike_tag_508, :del_tag_508

      # <strong>   Defines important text
      def strong_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :strong, options ) do
          concat( content )
        end
      end

      # <b>  Defines bold text
      alias_method :b_tag_508, :strong_tag_508

      # <sub> Defines subscripted text
      def sub_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :sub, options ) do
          concat( content )
        end
      end

      # <sup> Defines superscripted text
      def sup_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :sup, options ) do
          concat( content )
        end
      end

      # <time>     Defines a date/time
      def time_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :time, options ) do
          concat( content )
        end
      end

      # <tt> Defines teletype text.  Not supported in HTML5. Use CSS instead.
      def tt_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        deprecated_fail(tag: :tt) unless options[:override_deprecation]
        content_tag( :tt, options ) do
          concat( content )
        end
      end

      # <u>  Defines text that should be stylistically different from normal text
      def u_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :u, options ) do
          concat( content )
        end
      end

      # <var> Defines a variable
      def var_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :var, options ) do
          concat( content )
        end
      end

      # <wbr> Defines a possible line-break
      def wbr_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :wbr, options ) do
          concat( content )
        end
      end


      # <h1> to <h6>    Defines HTML headings
      def h_tag_508(content = nil, size = 1, options = nil, &block)
        size, options, content = content, size,  capture(&block).to_s.html_safe if block_given?
        options ||= {}
        case size
          when 2
            tag = :h2
          when 3
            tag = :h3
          when 4
            tag = :h4
          when 5
            tag = :h5
          when 6
            tag = :h6
          else
            tag = :h1
        end
        content_tag( tag, options ) do
          concat( content )
        end
      end


      def h1_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        h_tag_508(content, 1, options)
      end

      def h2_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        h_tag_508(content, 2, options)
      end

      def h3_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        h_tag_508(content, 3, options)
      end

      def h4_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        h_tag_508(content, 4, options)
      end

      def h5_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        h_tag_508(content, 5, options)
      end

      def h6_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        h_tag_508(content, 6, options)
      end


      # <p>  Defines a paragraph
      def p_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).to_s.html_safe if block_given?
        options ||= {}
        content_tag( :p, options ) do
          concat( content )
        end
      end

      # <br> Inserts a single line break
      def br_tag_508(options = {})
        tag('br', options, false)
      end

      # <hr> Defines a thematic change in the content
      def hr_tag_508(options = {})
        tag('hr', options, false)
      end

    end
  end
end