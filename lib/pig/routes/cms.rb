class ActionDispatch::Routing::Mapper

  def pig_route_cms(options = {})
    scope "/#{options[:path]}".squeeze('/') do
      # Load all the routes to work with permalinks
      Pig::ContentPackage.member_routes.each do |route|
        send(route[:method], route[:route].present? ? "*path/#{route[:route]}" : "*path" , to: "content_packages##{route[:action]}")
      end
    end
  end

end