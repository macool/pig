module Pig
  class EmbeddableType < Type
    def decorate(content_package)
      super
      slug = @slug
      content_package.define_singleton_method("#{@slug}_url") do
        send(slug)
      end
      content_package.define_singleton_method("#{@slug}_url=") do |value|
        send("#{slug}=", value)
      end
      content_package.define_singleton_method("#{@slug}_thumbnail") do
        content_package.json_content['content_chunks'][slug]['thumbnail']
      end
    end

    def set(content_package, value)
      json_value = {
        'value' => value,
        'field_type' => @field_type
      }

      if ENV["YOUTUBE_API_KEY"]
        begin
          video = Yt::Video.new url: value
          json_value["thumbnail"] = video.thumbnail_url(site = :high)
        rescue Yt::Errors::NoItems, Yt::Errors::RequestError
          Rails.logger.debug "Unable to assign video thumbnail"
        end
      end

      content_package.json_content['content_chunks'] ||= {}
      content_package.json_content['content_chunks'][@slug] = json_value
      content_package.json_content_will_change! if Rails.version.to_f < 4.2
    end
  end
end
