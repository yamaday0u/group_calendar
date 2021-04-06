class GroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_group, only: [:show, :edit, :update, :destroy]

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
    @userGroup = UserGroup.find_by(user_id: current_user.id, group_id: params[:id])
  end

  def edit
  end

  def update
    @group.update(group_params)
    if @group.valid?
      flash[:notice] = 'Updated group'
      redirect_to group_path(@group.id)
    else
      render 'edit'
    end
  end

  def destroy
    @group.destroy
    flash[:notice] = 'Deleted group'
    redirect_to calendars_path
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(
      :group_image,
      :name,
      :outline,
      :task
    )
  end
end
