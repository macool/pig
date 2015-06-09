module Pig
  class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
      instance_eval(&Pig.configuration.unpublished)
    end

    def current_ability
      @current_ability ||= Pig::Ability.new(current_user)
    end
  end
end
