module Xrel
  module Error
    module Generic
      class TimeOut < StandardError; end
      class UnableToConnect < StandardError; end
      class UnexpectedError < StandardError; end
    end
  end
end