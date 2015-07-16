module Pig::Permalinkable

  extend ActiveSupport::Concern

  included do
    attr_writer :permalink_path
    has_one :permalink, -> { where(:active => true) }, :as => :resource, :autosave => true
    has_many :permalinks, :as => :resource, :autosave => true, :dependent => :destroy
    validates :permalink, :presence => true, unless: 'viewless?', on: :update
    before_validation :set_permalink, :set_permalink_full_path
    after_validation :set_permalink_errors
    after_save :sync_child_full_paths
  end

  def permalink_path
    @permalink_path || permalink.try(:path)
  end

  def permalink_full_path
    permalink.try(:full_path)
  end

  # def permalink_path=(val)
  #   (self.permalink || self.build_permalink).path = val
  #   set_permalink_path
  #   set_permalink_full_path
  # end

  def permalink_display_path
    if Pig.configuration.nested_permalinks
      "/#{permalink_full_path}/".squeeze '/'
    else
      "/#{permalink_path}/".squeeze '/'
    end
  end

  private

  def set_permalink_errors
    permalink_errors = permalink.try(:errors).try(:get, :path)
    errors.add(:permalink_path, permalink_errors) if permalink_errors.present?
  end

  def set_permalink
    permalink = (self.permalink || self.build_permalink)
    if @permalink_path
      permalink.path = @permalink_path
    else
      permalink.generate_unique_path!(to_s)
    end
  end

  def set_permalink_full_path
    ancestor_with_view = self.first_ancestor_with_view
    return if permalink.nil? || (ancestor_with_view && ancestor_with_view.permalink && ancestor_with_view.permalink.full_path.nil?)
    self.permalink.full_path = ancestor_with_view && !ancestor_with_view.viewless? ? "#{CGI::escape(ancestor_with_view.permalink.full_path).gsub('%2F', '/')}/#{self.permalink.path}".squeeze('/') : "/#{self.permalink.path}"
  end

  def sync_child_full_paths
    return if new_record?
    if viewless?
      children.each do |x|
        x.save!
      end
    elsif permalink && permalink.previous_changes[:full_path]
      children.each do |x|
        unless x.viewless?
          x.permalinks.create(:active => false, :path => x.permalink.path, :full_path => "#{x.permalink.full_path}") unless x.permalink.nil? || ENV['RAKE_PERMALINK_RUNNING'] == 'true'
          x.editing_user = editing_user
          x.save!
        end
      end
    end
  end

end
