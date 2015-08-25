module Pig
  module Admin
    class ConfirmationsController < Devise::ConfirmationsController
      layout 'pig/simple'

      def update
        @user = resource_class.find_first_by_auth_conditions(confirmation_token: params[resource_name][:confirmation_token])
        yield @user if block_given?

        if @user.update(permitted_params)
          @user.confirm!
          set_flash_message(:notice, :confirmed) if is_flashing_format?
          respond_with_navigational(@user){ redirect_to after_confirmation_path_for(resource_name, @user) }
        else
          render 'show'
        end
      end

      # GET /resource/confirmation?confirmation_token=abcdef
      def show
        @user = resource_class.find_first_by_auth_conditions(confirmation_token: params[:confirmation_token])

        unless @user
          confirmation_digest = Devise.token_generator.digest(self, :confirmation_token, params[:confirmation_token])
          @user = resource_class.find_or_initialize_with_error_by(:confirmation_token, confirmation_digest)
        end

        yield @user if block_given?

        if @user.errors.any?
          respond_with_navigational(@user.errors, status: :unprocessable_entity){ render :new }
        end
      end

      protected
      def after_confirmation_path_for(resource_name, resource)
        pig.new_user_session_path
      end

      private
      def permitted_params
        params.require(resource_name).permit(:confirmation_token, :password, :password_confirmation)
      end

    end
  end
end
