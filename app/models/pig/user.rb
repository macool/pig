module Pig
  class User < ActiveRecord::Base
    
    include Pig::Concerns::Models::Roles
    include Pig::Concerns::Models::Name

    devise :database_authenticatable,
           :recoverable,
           :rememberable,
           :trackable,
           :validatable

    image_accessor :image
    send(:validates_property,
         :format,
         of: :image,
         in: [:jpeg, :jpg, :png, :gif, :bmp],
         case_sensitive: false,
         message: 'must be an image')

    scope :all_users, -> { where(role: Pig.configuration.cms_roles) }

    class << self
      def available_roles
        Pig.configuration.cms_roles || []
      end
    end
  end
end
