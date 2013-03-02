require 'faraday'

module GlassTrip
  class HTTPService < Struct.new(:url, :params)

    def request
      conn = Faraday.new(url)
      conn.headers['X-CT-API-KEY'] = ENV['CLEARTRIP_API_KEY']
      conn.params = params
      conn.get
    end

    def response
      Hash.from_xml(request.body)
    end

  end
end
