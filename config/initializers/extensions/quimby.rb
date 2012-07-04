module Foursquare
  class VenueProxy

    def search(options={})
      raise ArgumentError, "You must include :ll or :near" unless (options[:ll] || options[:near])
      response = @foursquare.get('venues/search', options)["groups"].inject({}) do |venues, group|
        venues[group["type"]] ||= []
        venues[group["type"]] += group["items"].map do |json|
          Foursquare::Venue.new(@foursquare, json)
        end
        venues
      end
    end
    
  end
end