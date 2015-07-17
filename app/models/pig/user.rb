module Pig
  class User < ActiveRecord::Base

    include Pig::Concerns::Models::Roles
    include Pig::Concerns::Models::Name

    validates :email, email: true, presence: true, uniqueness: true
    validates :password, presence: true, on: :create

    devise :database_authenticatable,
           :recoverable,
           :rememberable,
           :trackable,
           :validatable

    dragonfly_accessor :image
    send(:validates_property,
         :format,
         of: :image,
         in: [:jpeg, :jpg, :png, :gif, :bmp],
         case_sensitive: false,
         message: 'must be an image')

    scope :all_users, -> { where(role: Pig.configuration.cms_roles) }

    def available_roles
      all_roles = Pig::User.available_roles
      all_roles.reject do |r|
        all_roles.rindex(r.to_sym) < all_roles.rindex(role.to_sym)
      end
    end

    class << self
      def available_roles
        Pig.configuration.cms_roles || []
      end
    end
  end
end
