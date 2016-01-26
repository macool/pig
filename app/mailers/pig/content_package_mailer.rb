module Pig
  class ContentPackageMailer < ActionMailer::Base

    helper Pig::UrlHelper

    default from: "\"#{Settings.site_name}\" <#{Settings.site_noreply_email}>"

    def assigned(content_package, assigned_to)
      @content_package = content_package
      @user = assigned_to
      reason = @content_package.author.present? ? 'writing' : 'approval'
      @content = "has being assigned to you for #{reason}"
      mail(to: assigned_to.email, subject: "[#{Settings.site_name}] #{content_package.name} #{@content}")
    end

    def published(content_package, last_edited_by)
      @content_package = content_package
      @user = last_edited_by
      mail(to: last_edited_by.email, subject: "[#{Settings.site_name}] #{content_package.name} has been published")
    end

  end
end
