module Agenda
  module FoursquareClient
    def find_venue(venue_id)
      client.venues.find(venue_id)
    end

    private
    def client
      @foursquare ||= Foursquare::Base.new(ENV['FOURSQUARE_KEY'], ENV['FOURSQUARE_SECRET'])
    end
  end
end