module Pig
  module Admin
    class CommentsController < Pig::Admin::ApplicationController

      authorize_resource class: 'Pig::Comment'

      def create
        cp = find_content_package
        @comment = cp.comments.build(comment_params)
        @comment.user = current_user
        @comment.save
        render json: cp.comments
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
