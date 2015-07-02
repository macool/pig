module Pig
  class Engine < ::Rails::Engine
    isolate_namespace Pig

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    initializer 'pig.action_controller' do |app|
      ActiveSupport.on_load :action_controller do
        helper Pig::ApplicationHelper
        helper Pig::MetaTagsHelper
        helper Pig::LayoutHelper
      end
    end
  end
end
