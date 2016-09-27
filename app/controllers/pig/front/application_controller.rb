module Pig
  module Front
    class ApplicationController < ::ApplicationController
      helper Pig::ApplicationHelper
      helper Pig::MetaTagsHelper
      helper Pig::LayoutHelper
      helper Pig::NavigationHelper
      helper Pig::ContentHelper
      helper Pig::TitleHelper
      helper Pig::ImageHelper

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
