require 'rails_helper'

module Pig
  RSpec.describe Permalink do
    it { should validate_uniqueness_of(:full_path) }
  end
end
