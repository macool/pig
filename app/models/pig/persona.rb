module Pig
  class Persona < ActiveRecord::Base

    belongs_to :group, :class_name => "PersonaGroup"
    dragonfly_accessor :image
    dragonfly_accessor :file
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
      self.group = Pig::PersonaGroup.new(:name => name)
    end

    def to_s
      [name,category].select(&:present?).join(' - ')
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
