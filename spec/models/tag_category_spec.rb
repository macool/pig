require 'rails_helper'

RSpec.describe Pig::TagCategory do

  it { should have_many(:content_types) }

end
