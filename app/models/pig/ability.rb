module Pig
  class Ability
    include CanCan::Ability

    def initialize(user)

      # open ability
      can :show, Pig::ContentPackage do |content_package|
        content_package.visible_to_user?(nil)
      end

      if user
        if user.admin?
          # admin ability
          can :manage, :all
        elsif user.role == "author"
          # author ability
          can [:edit, :update], Pig::ContentPackage, :author_id => user.id
          can [:show], Pig::ContentPackage
          can [:dashboard], Pig::ContentType
        elsif user.role == "editor"
          # editor ability
          can [:edit, :update], Pig::ContentPackage, :author_id => user.id
          can [:manage], Pig::ContentPackage
          can [:dashboard], Pig::ContentType
        elsif user.role == "blogger"
          can [:create], Pig::ContentPackage, :content_type_id => Pig::ContentType.blogger_id
          can [:edit, :show, :update], Pig::ContentPackage do |content_package|
            content_package.content_type_id == Pig::ContentType.blogger_id && content_package.author_id == user.id
          end
          can :contributor_blog_posts, Pig::ContentPackage
        end
        # user ability
        can :show, Pig::ContentPackage do |content_package|
          content_package.visible_to_user?(user)
        end
        can [:edit, :show, :update], User, id: user.id

      end
    end
  end
end
