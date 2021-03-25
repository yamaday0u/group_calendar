class UserGroupsController < ApplicationController
  before_action :authenticate_user!
  def index
    @userGroups = UserGroup.includes(:user).where(group_id: params[:group_id])
    @group = Group.find(params[:group_id]) # To display "calendar_for_groups/nav_bar, nav_bar_tab"
  end

  def create
    userGroup = UserGroup.new(user_id: current_user.id, group_id: params[:group_id])
    redirect_to group_calendar_for_groups_path(userGroup.group_id), notice: 'joined the group!!' if userGroup.save
  end
end
