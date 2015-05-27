module Pig
  class PersonaGroup < ActiveRecord::Base
    self.table_name = 'pig_persona_groups'

    has_many :personas, :foreign_key => :group_id
    validates :name, :presence => true

    def to_s
      name
    end

  end
end
