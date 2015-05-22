require_relative 'routes/cms'
require_relative 'routes/cms_admin'

class ActionDispatch::Routing::Mapper
  def pig_route(identifier, options = {})
    send("pig_route_#{identifier}", options)
  end
end