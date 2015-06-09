module Pig
  class User < ActiveRecord::Base
    include YmUsers::User

    table_name = 'users'
    scope :all_users, -> { where(role: Pig::configuration.cms_roles) }

    class << self

      def available_roles
        Pig::configuration.cms_roles
      end

    end
  end
end