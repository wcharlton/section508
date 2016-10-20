module Section508
  module Helpers
    module SemanticHelper

    # <style>    Defines style information for a document
      def style_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :style, options ) do
          concat( content )
        end
      end

      # <div> Defines a section in a document
      def div_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :div, options ) do
          concat( content )
        end
      end

    # <span>     Defines a section in a document
      def span_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :span, options ) do
          concat( content )
        end
      end

    # <header>   Defines a header for a document or section
      def header_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :header, options ) do
          concat( content )
        end
      end

    # <footer>   Defines a footer for a document or section
      def footer_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :footer, options ) do
          concat( content )
        end
      end

    # <main>     Specifies the main content of a document
      def main_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :main, options ) do
          concat( content )
        end
      end

    # <section>  Defines a section in a document
      def section_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :section, options ) do
          concat( content )
        end
      end

    # <article>  Defines an article
      def article_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :article, options ) do
          concat( content )
        end
      end

    # <aside>    Defines content aside from the page content
      def aside_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :aside, options ) do
          concat( content )
        end
      end

    # <details>  Defines additional details that the user can view or hide
      def details_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :details, options ) do
          concat( content )
        end
      end

    # <dialog>   Defines a dialog box or window
      def dialog_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :dialog, options ) do
          concat( content )
        end
      end

    # <summary>  Defines a visible heading for a <details> element
      def summary_tag_508(content = nil, options = nil, &block)
        options, content = content, capture(&block).html_safe if block_given?
        options ||= {}
        content_tag( :summary, options ) do
          concat( content )
        end
      end



                                                                                                                                              end
  end
end
