module Pig
  class User < ActiveRecord::Base

    include Pig::Concerns::Models::Roles
    include Pig::Concerns::Models::Name

    has_many :assigned_content_packages,
      class_name: '::Pig::ContentPackage',
      foreign_key: 'author_id'

    validates :email, :'pig/email' => true, presence: true, uniqueness: true

    devise :database_authenticatable,
           :recoverable,
           :rememberable,
           :trackable,
           :validatable,
           :confirmable

    dragonfly_accessor :image
    send(:validates_property,
         :format,
         of: :image,
         in: [:jpeg, :jpg, :png, :gif, :bmp],
         case_sensitive: false,
         message: 'must be an image')

    scope :all_users, -> { where(role: Pig.configuration.cms_roles) }

    delegate :can?, :cannot?, to: :ability

    def ability
      @ability ||= Pig::Ability.new(self)
    end

    def available_roles
      all_roles = Pig::User.available_roles
      all_roles.reject do |r|
        all_roles.rindex(r.to_sym) < all_roles.rindex(role.to_sym)
      end
    end

    def serializable_hash(options={})
      options = {
        methods: [:full_name, :profile_picture_url]
      }.update(options)
      super(options)
    end

    def profile_picture_url
      image.try(:url) || ActionController::Base.helpers.asset_path("pig/default_user.jpg", digest: false)
    end

    def password_required?
      # Password is required if it is being set, but not for new records
      if !persisted?
        false
      else
        !password.nil? || !password_confirmation.nil?
      end
    end

    def role
      super.try(:inquiry)
    end

    class << self
      def available_roles
        Pig.configuration.cms_roles || []
      end
    end
  end
end
