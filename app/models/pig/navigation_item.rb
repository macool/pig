module Pig
  class NavigationItem < ActiveRecord::Base
    self.table_name = 'pig_navigation_items'

    belongs_to :parent, :class_name => 'NavigationItem'
    belongs_to :resource, :polymorphic => true
    has_one :grandparent, :through => :parent, :source => :parent
    has_many :children, -> { order(:position) }, :class_name => 'NavigationItem', :foreign_key => :parent_id

    attr_writer :link
    image_accessor :image
    image_accessor :logo

    validates :title, :presence => true

    before_validation :process_link

    scope :root, lambda{ where(:parent_id => nil).order(:position) }
    scope :level_two, lambda{ joins(:parent).where(:parents_navigation_items => {:parent_id => nil})}
    scope :level_three, lambda{ joins(:grandparent).where(:grandparents_navigation_items => {:parent_id => nil})}

    def depth
      parents.size
    end

    def linkable
      url.presence || resource
    end

    def name
      title
    end

    def parents
      [parent, parent.try(:parents)].flatten.compact
    end

    private
    def process_link
      if @link == ''
        self.url = nil
        self.resource = nil
      elsif !@link.nil?
        path = @link.to_s.sub(/^\//,'')
        if permalink = Permalink.find_by_path(path.downcase)
          self.resource = permalink.resource
          self.url = nil
        else
          self.url = @link
          self.resource = nil
        end
      end
    end

  end
end
