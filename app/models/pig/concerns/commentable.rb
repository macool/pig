module Pig
  module Concerns
    module Commentable
      extend ActiveSupport::Concern

      included do
        acts_as_commentable
      end

    end
  end
end
