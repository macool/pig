module Pig
  module UserHelper
    def cms_user_url_and_method_create_edit(user)
      { :url => user.new_record? ? pig_users_create_path : pig_user_path(user),
        :method => user.new_record? ? :post : :put
      }
    end
  end
end