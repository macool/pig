module Pig
  module Front
    class ApplicationController < ::ApplicationController
      before_action :set_paper_trail_whodunnit

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
