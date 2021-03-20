class CalendarForGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_member
  before_action :set_group, only: %i[index new show create edit]
  before_action :set_group_calendar, only: %i[show edit update destroy]

  def index
    @group_calendars = CalendarForGroup.includes(:group).where(group_id: params[:group_id])
  end

  def new
    @group_calendar = CalendarForGroup.new
  end

  def create
    @group_calendar = CalendarForGroup.new(group_calendar_params)
    if @group_calendar.valid?
      @group_calendar.save
      redirect_to group_calendar_for_groups_path(@group_calendar.group_id), notice: 'Added schejule'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(@group_calendar.user_id)
  end

  def edit
  end

  def update
    @group_calendar.update(group_calendar_params)
    if @group_calendar.valid?
      flash[:notice] = 'Updated schejule'
      redirect_to group_calendar_for_group_path(@group_calendar.group_id)
    else
      render 'edit'
    end
  end

  def destroy
    @group_calendar.destroy
    flash[:notice] = 'Deleted schejule'
    redirect_to group_calendar_for_groups_path(@group_calendar.group_id)
  end

  private

  def set_group_calendar
    @group_calendar = CalendarForGroup.find(params[:id])
  end

  def set_group
    @group = Group.find(params[:group_id])
  end

  def group_calendar_params
    params.require(:calendar_for_group).permit(
      :title,
      :content,
      :start_time,
      :end_time
    ).merge(
      user_id: current_user.id,
      group_id: params[:group_id]
    )
  end

  def check_member
    unless UserGroup.find_by(user_id: current_user.id, group_id: params[:group_id]).present?
      redirect_to group_path(params[:group_id])
    end
  end
end
