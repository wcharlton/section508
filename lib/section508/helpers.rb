module Section508
  module Helpers
    extend ActiveSupport::Autoload
    extend ActiveSupport::Concern

    autoload :ImageHelper
    autoload :TableHelper
    include ImageHelper
    include TableHelper
  end
end
