module Pig
  class Engine < ::Rails::Engine

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end

    # config.nested_permalinks = true
    # config.tags_feature = false

    # config.unpublished do
    #   puts "Test"
    # end
  end
end
