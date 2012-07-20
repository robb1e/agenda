module Agenda
  class Planner
    include Agenda::FoursquareClient

    attr_reader :plan_id
    attr_reader :user

    def initialize(plan_id, user)
      @plan_id = plan_id
      @user = user
    end

    def plan
      @plan ||= Plan.find(@plan_id)
    end

    def add_venue_by_foursquare_id(foursquare_venue_id)
      place = Place.find_by_foursquare_id(foursquare_venue_id) || find_and_create(foursquare_venue_id)
      Pick.create(plan_id: @plan_id, place: place)
    end

    def pick(pick_id)
      Pick.find_by_id_and_plan_id(pick_id, @plan_id)
    end

    def picked
      plan.picks.reject { |p| nil == p.from }.sort_by(&:from).group_by{|p| p.from.to_date }
    end

    def is_member?
      plan.memberships.any? { |membership| membership.user == @user }
    end

    def create_invitation
      Invitation.create do |invite| 
        invite.user = @user
        invite.plan = plan
        invite.invite_code = create_invite_code
      end
    end

    def invitations
      Invitation.find_all_by_plan_id(plan) || []
    end

    def members
      plan.memberships
    end

    private
    def find_and_create(foursquare_venue_id)
      result = find_venue(foursquare_venue_id)
      Place.create(foursquare_id: foursquare_venue_id, name: result.name)
    end

    def create_invite_code
      rand(36**8).to_s(36)
    end

  end
end