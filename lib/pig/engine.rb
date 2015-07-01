module Pig
  class Engine < ::Rails::Engine
    isolate_namespace Pig

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end

      # Tell devise to use a different - simple layout
      Devise::SessionsController.layout "pig/simple"
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
