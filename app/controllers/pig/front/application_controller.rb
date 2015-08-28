module Pig
  module Front
    class ApplicationController < ::ApplicationController

      rescue_from ActiveRecord::RecordNotFound do |exception|
        instance_eval(&Pig.configuration.not_found)
      end

      protected

      def current_ability
        @current_ability ||= Pig::Ability.new(current_user)
      end

    end
  end
end
