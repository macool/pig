module Pig
  module Front
    class ApplicationController < ::ApplicationController

      protected

      def after_sign_in_path_for(resource)
        pig.root_path
      end

      def current_ability
        @current_ability ||= Pig::Ability.new(current_user)
      end

    end
  end
end
