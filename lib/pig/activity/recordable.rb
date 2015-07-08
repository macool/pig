module Pig::Recordable

  def self.included(base)
    base.has_many :activity_items, :as => :resource, :dependent => :destroy, :class_name => "ActivityItem"
  end

  def record_activity!(user, text)
    self.activity_items.create(user_id: user.id, text: text)
  end

end
