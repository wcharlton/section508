module Section508
  module Helpers
    extend ActiveSupport::Autoload
    extend ActiveSupport::Concern

    autoload :Section508Helper
    autoload :ImageHelper
    autoload :TableHelper
    autoload :FieldsetHelper
    autoload :LinkHelper
    autoload :FormattingHelper
    autoload :MediaHelper
    autoload :ListHelper
    autoload :SemanticHelper
    autoload :FrameHelper
    include Section508Helper
    include ImageHelper
    include TableHelper
    include FieldsetHelper
    include LinkHelper
    include FormattingHelper
    include MediaHelper
    include ListHelper
    include SemanticHelper
    include FrameHelper
  end
end
