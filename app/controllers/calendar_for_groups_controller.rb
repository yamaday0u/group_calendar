class CalendarForGroupsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_g_calendar, only: %i[show edit update destroy]

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

  def show
    @user = User.find(@g_calendar.user_id)
    @group = Group.find(@g_calendar.group_id)
  end

  def edit
    
  end

  def update
    @g_calendar.update(g_calendar_params)
    if @g_calendar.valid?
      flash[:notice] = 'Updated schejule'
      redirect_to group_calendar_for_group_path(@g_calendar.id)
    else
      render 'edit'
    end
  end

  def destroy
    @g_calendar.destroy
    flash[:notice] = 'Deleted schejule'
    redirect_to group_calendar_for_groups_path
  end

  private

  def set_g_calendar
    @g_calendar = CalendarForGroup.find(params[:group_id])
  end

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
