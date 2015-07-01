module Pig
  class Manage::UsersController < ApplicationController

    load_and_authorize_resource class: 'Pig::User'

    def set_active
      @user.update(active: !@user.active)
      @show_inactive = session[:show_inactive] || false
    end

    def index
      @show_inactive = (params[:show_inactive] && params[:show_inactive] == "true") || false
      if @show_inactive
        @users = Pig::User.all_users
      else
        @users = Pig::User.all_users.where(active: true)
      end
      @users = @users.order('LOWER(last_name)')
      session[:show_inactive] = @show_inactive
    end

    def destroy
      # Cast back to user so we don't break all the callbacks
      @user_id = @user.id
      @user.destroy
    end

    def show
      @assigned_content = Pig::ContentPackage.where(author_id: @user.id)
    end

    def edit
    end

    def update
      if @user.update_attributes(user_params)
        redirect_to pig.manage_user_path(@user)
      else
        render :action => "edit"
      end
    end

    def create
      if @user.save
        redirect_to(pig.manage_user_path(@user))
      else
        render :action => "new"
      end
    end

    def new
    end

    private

      def user_params
        params.require(:user).permit(permitted_user_parameters.push(:role, :password))
      end

      def permitted_user_parameters
        permitted_params = %w(bio email first_name image last_name remove_image retained_image active)
        permitted_params << 'role' if current_user.admin?
        permitted_params
      end
  end
end
