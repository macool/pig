module Pig
  class ApplicationController < ActionController::Base

    layout "pig/application"

    rescue_from CanCan::AccessDenied do |exception|
      redirect_to pig.new_user_session_path
    end

    def current_ability
      @current_ability ||= Pig::Ability.new(current_user)
    end
  end
end
