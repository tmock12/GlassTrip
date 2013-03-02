require 'glasstrip/http_service'

module GlassTrip
  class Search
    URL = "http://api.staging.cleartrip.com/air/1.0/search"

    attr_reader :options

    def initialize(options={})
      @options = options
    end

    def params
      {}.tap do |h|
        h['from'] = options[:from]
        h['to'] = options[:to]
        h['depart-date'] = options[:departure_date]
        h['return-date'] = options[:return_date]
        h['adults'] = options[:adults]
        h['children'] = options[:children]
        h['infants'] = options[:infants]
        h['carrier'] = carrier
        h['cabin-type'] = options[:cabin_type]
        h['permitted-carriers'] = options[:permitted_carriers].join('-')
        h['sort'] = options[:sort]
      end
    end

    def response
      GlassTrip::HTTPService.new(URL, params).response
    end

    private

    def carrier
      options[:carrier].kind_of?(Array) ? options[:carrier].join('-') : options[:carrier]
    end

  end
end
