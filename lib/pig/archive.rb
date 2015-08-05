module Pig
  class Archive
    def initialize(request)
      @request = request
    end

    def active?
      domain.present?
    end

    def domain
      Pig.configuration.archive_domain
    end

    def exists?
      HTTParty.get(uri).success?
    end

    def path
      request_uri = @request.env['REQUEST_URI']
      request_uri.gsub(@request.base_url, '')
    end

    def uri
      domain + path
    end
  end
end
