require 'rails_helper'

RSpec.describe Pig::Permalink do

  it { should validate_uniqueness_of(:full_path) }

end
