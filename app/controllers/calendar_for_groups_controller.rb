class CalendarForGroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @g_calendars = CalendarForGroup.includes(:group).where(group_id: params[:group_id])
    @group = Group.find(params[:group_id])
  end

  def new
    @g_calendar = CalendarForGroup.new
  end

  def create
    @g_calendar = CalendarForGroup.new(g_calendar_params)
    if @g_calendar.valid?
      @g_calendar.save
      redirect_to group_calendar_for_groups_path(@g_calendar.group_id), notice: 'Added schejule'
    else
      render 'new'
    end    
  end

  private

  def g_calendar_params
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
end
