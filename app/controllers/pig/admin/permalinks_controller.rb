module Pig
  module Admin
    class PermalinksController < Pig::Admin::ApplicationController
      before_action :find_permalink
      load_and_authorize_resource class: 'Pig::Permalink'

      def destroy
        @permalink.destroy
        redirect_to pig.edit_admin_content_package_path(@permalink.resource,
                                                        notice: t('actions.destroyed', class: Pig::Permalink.model_name.human))
      end

      private

      def find_permalink
        @permalink = Pig::Permalink.find_by(full_path: "/#{params[:id]}")
      end
    end
  end
end
