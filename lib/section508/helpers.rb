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
    autoload :MediaHelper
    autoload :ListsHelper
    include Section508Helper
    include ImageHelper
    include TableHelper
    include FieldsetHelper
    include LinkToHelper
    include FormattingHelper
    include MediaHelper
    include ListsHelper
  end
end
