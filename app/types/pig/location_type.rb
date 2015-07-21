module Pig
  class LocationType < Type
    def decorate(content_package)
      slug = @slug
      super(content_package)
      content_package.class.send(:define_method, "#{@slug}_lat_lng") do
        chunk = content_package.content['content_chunks'][slug]
        [chunk['lat'] || '', chunk['lng'] || '']
      end
    end

    def set(content_package, value)
      lat, lng = Geocoder.coordinates(value)
      content_package.content['content_chunks'][@slug] = {
        'value' => value,
        'field_type' => @field_type,
        'lat' => lat,
        'lng' => lng
      }
    end
  end
end
