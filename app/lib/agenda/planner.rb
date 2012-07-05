module Agenda 
  class Planner
    include Agenda::FoursquareClient
  
    attr_reader :plan
  
    def initialize(plan_id)
      @plan = Plan.find(plan_id)
    end
  
    def add_venue_by_foursquare_id(foursquare_venue_id)
      place = Place.find_by_foursquare_id(foursquare_venue_id) || find_and_create(foursquare_venue_id)
      Pick.create(plan: @plan, place: place)
    end
  
    private 
    def find_and_create(foursquare_venue_id)
      result = find_venue(foursquare_venue_id)
      Place.create(foursquare_id: foursquare_venue_id, name: result.name)
    end
  
  end
end