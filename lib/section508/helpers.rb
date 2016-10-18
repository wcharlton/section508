module Section508
  module Helpers
    extend ActiveSupport::Autoload
    extend ActiveSupport::Concern

    autoload :Section508Helper
    autoload :ImageHelper
    autoload :TableHelper
    autoload :FieldsetHelper
    autoload :LinkToHelper
    autoload :FormattingHelper
    include Section508Helper
    include ImageHelper
    include TableHelper
    include FieldsetHelper
    include LinkToHelper
    include FormattingHelper
  end
end
