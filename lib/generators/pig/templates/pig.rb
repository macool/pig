# encoding: utf-8
Pig.setup do |config|
    # Should the permalinks of content packages be nested based on there position in the Content list
      # For example:
      # Parent Page (/parent)
      #   |
      #   +--+Child Page (/parent/child)
      #   |
      #   +--+Another Child page (/parent/another-child)
      #      |
      #      +-->Granchchild page (/parent/another-child/grandchild)

  # config.mount_path = 'cms'
  config.unpublished = proc { redirect_to Pig::Engine.routes.url_helpers.content_package_path(Pig::ContentPackage.find_by(slug: 'coming-soon') ) }
  config.nested_permalinks = true
  config.tags_feature = true
  # config.redactor_plugins = %w(bufferbuttons video blockQuote)
  # config.basic_redactor_plugins = ['bufferbuttons']
  config.cms_roles = [:developer, :admin, :editor, :author]
  # config.content_types = {}
  config.homepage = proc { Pig::ContentPackage.find_by slug: 'home' }
  # config.archive_domain = 'http://www.example.com'
  # config.ga_code = 'UA-xxxxxxxx-1'
end
