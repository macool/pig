module Pig
  class Persona < ActiveRecord::Base

    belongs_to :group, :class_name => "PersonaGroup"
    has_and_belongs_to_many :content_packages, class_name: 'Pig::ContentPackage'

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

    def get_pages(status = 'published')
      content_packages.where(status: status)
    end

    def count_pages(status = 'published')
      get_pages(status).count
    end

    def percentage_pages(status = 'published')
      count = count_pages(status)
      total = Pig::ContentPackage.where(status: status).count
      percentage = count.to_f / total.to_f * 100.0
      return percentage.round 1
    end

    def self.get_pages_without_personas(status = 'published')
      pages = []
      results = Pig::ContentPackage.where(status: status)
      results.each do |page|
        pages << page if page.personas.count == 0
      end
      return pages
    end

    def self.count_pages_without_personas(status = 'published')
      count = 0
      results = Pig::ContentPackage.where(status: status)
      results.each do |page|
        count += 1 if page.personas.count == 0
      end
      return count
    end

    def self.percentage_pages_without_personas(status = 'published')
      count = Pig::Persona.count_pages_without_personas(status)
      total = Pig::ContentPackage.where(status: status).count
      percentage = count.to_f / total.to_f * 100.0
      return percentage.round 1
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

    def percent_of(n)
      self.to_f / n.to_f * 100.0
    end

  end
end
