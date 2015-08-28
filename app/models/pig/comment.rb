
module Pig
  class Comment < ActiveRecord::Base
    include ActsAsCommentable::Comment
    include ActionView::Helpers::DateHelper

    belongs_to :commentable, :polymorphic => true
    belongs_to :user

    default_scope -> { order('created_at ASC') }

    def serializable_hash(options={})
      options ||= {}
      options = {
        methods: [:pretty_time, :formatted_created_at],
        include: :user
      }.update(options)
      super(options)
    end

    def pretty_time
      time_ago_in_words(created_at)
    end

    def formatted_created_at
      created_at.strftime("%e %B %Y, %I:%M")
    end

  end
end
