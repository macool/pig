module Pig
  class Version < ::ActiveRecord::Base
    include PaperTrail::VersionConcern
    self.table_name = 'pig_versions'
  end
end
