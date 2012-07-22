class InvitationsController < ApplicationController

    def join
        invite_code = params[:invite_code]
        planner = Agenda::Planner.join(invite_code, current_user)
        redirect_to plan_path(planner.plan)
    end

end