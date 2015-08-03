module Pig
  class LocationType < Type
    def decorate(content_package)
      this = self
      super(content_package)
      content_package.define_singleton_method("#{@slug}_lat_lng") do
        chunk = this.content_chunk(content_package)
        [chunk['lat'] || '', chunk['lng'] || '']
      end
    end

    def set(content_package, value)
      lat, lng = Geocoder.coordinates(value)
      content_package.json_content['content_chunks'] ||= {}
      content_package.json_content['content_chunks'][@slug] = {
        'value' => value,
        'field_type' => @field_type,
        'lat' => lat,
        'lng' => lng
      }
    end
  end
end
