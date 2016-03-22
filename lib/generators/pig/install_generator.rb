require 'rails/generators/base'
require 'fileutils'

module Pig
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      def create_template_folder
        puts "Creating an empty templates dir under app/views/pig"
        dir = "#{Rails.root}/app/views/pig/templates"
        unless File.directory?(dir)
          FileUtils.mkdir_p(dir)
        end
      end

      def configure_email_default_host
        inject_into_file "#{Rails.root}/config/environments/development.rb",
          after: "Rails.application.configure do" do
          <<DOC

  # Set default host for mailers - Added by Pig
  config.action_mailer.default_url_options = { :host => 'localhost:3000' }
DOC
        end
      end

      def copy_initializer_file
        copy_file "pig.rb", "config/initializers/pig.rb"
        copy_file "homepage.html.erb", "app/views/pig/templates/homepage.html.erb"
      end

      def install_migrations
        rake 'pig:install:migrations'
      end

      def generate_routing
        route_string  = "mount Pig::Engine, at: '/'"
        route route_string
      end

      def installed_message
        puts "Oink Oink..🐷"
      end

    end
  end
end
