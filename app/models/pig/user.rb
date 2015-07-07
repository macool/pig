module Pig
  class User < ActiveRecord::Base

    YOOMEE_EMAILS = %w{andy nicola rich ian matt edward chrystal jon tim greg}
      .map{|u| "#{u}@yoomee.com"}

    include Pig::Concerns::Models::Roles
    include Pig::Concerns::Models::Name

    devise :database_authenticatable, :recoverable, :rememberable,
      :trackable, :registerable, :validatable

    image_accessor :image
    send(:validates_property,
         :format, :of => :image, :in => [:jpeg, :jpg, :png, :gif, :bmp],
         :case_sensitive => false, :message => "must be an image")


    self.table_name = 'users'

    scope :all_users, -> { where(role: Pig::configuration.cms_roles) }

    class << self
      def available_roles
        Pig::configuration.cms_roles || []
      end
    end
  end
end
