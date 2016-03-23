module Pig
  class PersonaGroup < ActiveRecord::Base
    
    has_many :personas, :foreign_key => :group_id
    validates :name, :presence => true

    def to_s
      name
    end

  end
end
