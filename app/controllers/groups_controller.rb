class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    group = Group.new(group_params)
    if group.valid?
      group.save
      UserGroup.create(user_id: current_user.id, group_id: group.id)
      redirect_to  group_calendar_for_groups_path(group.id), notice: 'Created new group'
    else
      render 'new'
    end
  end

  def show
    @group = Group.find(params[:id])
    @userGroup = UserGroup.find_by(user_id: current_user.id, group_id: params[:id])
  end

  private

  def group_params
    params.require(:group).permit(
      :name,
      :outline,
      :task
    )
  end
end
