class MembersController < AuthenticatedController

  def create
    planner.create_invitation
    redirect_to plan_members_path
  end

  def index
    @invitations = planner.invitations
    @members = planner.members
  end

end