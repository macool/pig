# shuts down verbose cache logging
if %w(development test).include? Rails.env
  Rails.application.middleware.delete(Rack::Cache)

  Rails.application.middleware.insert 0, Rack::Cache, {
    :verbose     => false, # this is set to true in dragonfly/rails/images
    :metastore   => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/meta"), # URI encoded in case of spaces
    :entitystore => URI.encode("file:#{Rails.root}/tmp/dragonfly/cache/body")
  }
end
