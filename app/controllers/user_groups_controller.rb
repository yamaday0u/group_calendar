class UserGroupsController < ApplicationController
  def create
    @userGroup = UserGroup.new(user_id: current_user.id, group_id: params[:group_id])
    redirect_to group_calendar_for_groups_path(@userGroup.group_id), notice: 'joined the group!!' if @userGroup.save
  end
end
