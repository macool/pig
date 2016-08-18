module Pig
  module Admin
    class CommentsController < Pig::Admin::ApplicationController

      authorize_resource class: 'Pig::Comment'
      before_action :find_content_package

      def create
        comment = @content_package.comments.build(comment_params)
        comment.user = current_user
        comment.save
        render json: @content_package.comments
      end

      private
      def comment_params
        params.require(:comments).permit(:comment)
      end

      def find_content_package
        @content_package = Pig::Permalink.find_by(full_path: "/#{params[:content_package_id]}".squeeze('/')).try(:resource)
        @content_package = Pig::ContentPackage.find(params[:content_package_id]) if @content_package.nil?
        @content_package
      end

    end
  end
end
