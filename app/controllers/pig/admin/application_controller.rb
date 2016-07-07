module Pig
  module Admin
    class ApplicationController < ::ApplicationController
      layout 'pig/application'
      before_filter :set_paper_trail_whodunnit

      rescue_from CanCan::AccessDenied do |exception|
        if current_user
          redirect_to pig.admin_not_authorized_path, alert: exception.message
        else
          redirect_to pig.new_user_session_path, alert: exception.message
        end
      end

      def not_authorized
      end

      protected

        def after_sign_in_path_for(resource)
          pig.admin_root_path
        end

        def current_ability
          @current_ability ||= Pig::Ability.new(current_user)
        end

    end
  end
end
