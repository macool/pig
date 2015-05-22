# module Pig
#   class CmsUser < ActiveRecord::Base
#     # include YmUsers::User

#     table_name = 'users'
#     scope :all_users, -> { base.where(role: YmContent::config.cms_roles) }
#     extend(ClassMethods)

#     module ClassMethods

#       def available_roles
#         YmContent::config.cms_roles
#       end

#     end
#   end
# end