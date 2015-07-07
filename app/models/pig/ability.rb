module Pig
  class Ability
    include CanCan::Ability

    DEVELOPER_ABILITIES = {
      'Pig::ContentType' => [
        :manage_description,
        :manage_package_name,
        :manage_view_name,
        :manage_viewless,
        :manage_singleton
      ]
    }

    def initialize(user)
      can :show, Pig::ContentPackage do |content_package|
        content_package.visible_to_user?(nil)
      end

      return unless user

      can [:edit, :show, :update], Pig::User, id: user.id

      if user.role_is?(:developer)
        can :manage, :all
      elsif user.role_is?(:admin)
        can :manage, :all
        DEVELOPER_ABILITIES.each do |klass, actions|
          actions.each do |action|
            cannot action, klass.constantize
          end
        end
      elsif user.role_is?(:editor)
        can [:edit, :update], Pig::ContentPackage, :author_id => user.id
        can [:manage], Pig::ContentPackage
        can [:dashboard], Pig::ContentType
      elsif user.role_is?(:author)
        can [:edit, :update], Pig::ContentPackage, :author_id => user.id
        can [:show], Pig::ContentPackage
        can [:dashboard], Pig::ContentType
        can :contributor_blog_posts, Pig::ContentPackage
      end
    end
  end
end

