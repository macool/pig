module Pig
  class ContentPackageMailer < ActionMailer::Base

    helper Pig::UrlHelper

    default from: Settings.site_noreply_email

    def assigned(content_package, assigned_to, reason)
      @content_package = content_package
      @user = assigned_to
      @content = "has being assigned to you for #{reason}"
      mail(to: assigned_to.email, subject: "[#{Settings.site_name}] #{content_package.name} #{@content}")
    end

    def published(content_package, last_edited_by)
      @content_package = content_package
      @user = last_edited_by
      mail(to: last_edited_by.email, subject: "[#{Settings.site_name}] #{content_package.name} has been published")
    end

    def getting_old(user, content_packages)
      @content_packages = content_packages
      @user = user
      if @content_packages.count > 1
        title = "#{@content_packages.count} content packages are "
      else
        title = "#{@content_packages.first.name} is"
      end
      mail(to: @user.email, subject: "[#{Settings.site_name}] #{title} getting old")
    end

  end
end
