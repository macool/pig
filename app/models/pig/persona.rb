module Pig
  class Persona < ActiveRecord::Base
    self.table_name = 'pig_personas'

    belongs_to :group, :class_name => "PersonaGroup"
    image_accessor :image
    file_accessor :file
    validate :group_name_is_valid

    def benefits
      [ benefit_1, benefit_2, benefit_3, benefit_4 ].select(&:present?).compact
    end

    def group_name
      if group && group.new_record?
        group.name
      else
        nil
      end
    end

    def group_name=(name)
      self.group = PersonaGroup.new(:name => name)
    end

    def to_s
      [namecategory].select(&:present?).join(' - ')
    end

    private
    def group_name_is_valid
      return true unless group
      group.valid?
      group.errors.each do |attr, message|
        self.errors.add(:group_name, message)
      end
      group.errors.blank?
    end

  end
end
