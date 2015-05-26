module Pig
  class Engine < ::Rails::Engine
    isolate_namespace Pig

    config.to_prepare do
      Dir.glob(Rails.root + "app/decorators/**/*_decorator*.rb").each do |c|
        require_dependency(c)
      end
    end

    # config.to_prepare do
    #   Dir.glob(Rails.root + "app/helpers/**/*_helper*.rb").each do |c|
    #     require_dependency(c)
    #   end
    # end

    config.nested_permalinks = true
    config.tags_feature = false
  end
end
