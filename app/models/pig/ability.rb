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
      ],
      'Pig::ContentPackage' => [
        :manage_slug
      ]
    }

    def initialize(user)
      can :home, Pig::ContentPackage
      can :show, Pig::ContentPackage do |content_package|
        content_package.visible_to_user?(nil)
      end

      return unless user

      can [:edit, :show, :update], Pig::User, id: user.id
      if user.role_is?(:developer)
        can :manage, :all
      elsif user.role_is?(:admin)
        can :manage, :all
        cannot :alter_role, Pig::User
        can :alter_role, Pig::User do |other_user|
          other_user.role.to_sym.in?(user.available_roles)
        end
        DEVELOPER_ABILITIES.each do |klass, actions|
          actions.each do |action|
            cannot action, klass.constantize
          end
        end
      elsif user.role_is?(:editor)
        can [:edit, :update], Pig::ContentPackage, :author_id => user.id
        can [:manage], Pig::ContentPackage
        cannot :destroy,  Pig::ContentPackage
        can [:index, :dashboard, :children], Pig::ContentType
      elsif user.role_is?(:author)
        can [:edit, :update], Pig::ContentPackage, :author_id => user.id
        can [:index, :show, :activity, :ready_to_review, :search], Pig::ContentPackage
        can [:index, :dashboard, :children], Pig::ContentType
        can :contributor_blog_posts, Pig::ContentPackage
      end
    end
  end
end
