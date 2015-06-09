module Pig
  class UsersController < ApplicationController

    authorize_resource
    before_action :check_cms_user, except: [:index, :new, :create_user]

    def check_cms_user
      @user = Pig::User.find(params[:id])
      unless Pig::User.available_roles.include? @user.role
        raise ActiveRecord::RecordNotFound
      end
    end

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
      @user = User.find(@user.id)
      @user_id = @user.id
      @user.destroy
    end

    def show
      @assigned_content = Pig::ContentPackage.where(author_id: @user.id)
    end

    def edit
    end

    def update
      if @user.update_attributes(create_user_params)
        return_or_redirect_to(@user)
      else
        render :action => "edit"
      end
    end

    def create_user
      # Admins need to be able to sign people up, can't use create route because it signs you in
      @user = Pig::User.new(create_user_params)
      if @user.save
        redirect_to(pig_user_path(@user))
      else
        render :action => "new"
      end
    end

    def new
      @user = Pig::User.new
    end

    private

    def create_user_params
      params.require(:pig_user).permit(permitted_user_parameters.push(:role, :password))
    end

    def permitted_user_parameters
      permitted_params = %w(bio email first_name image last_name remove_image retained_image active)
      permitted_params << 'role' if current_user.admin?
      permitted_params
    end
  end
end
