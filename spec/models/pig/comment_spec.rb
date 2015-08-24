require 'rails_helper'

module Pig
  RSpec.describe Comment, type: :model do

    it { should belong_to(:user) }
    it { should belong_to(:commentable) }

  end
end
