class CalendarsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_calendar, only: %i[show edit update destroy]

  def index
    user_calendars = Calendar.where(user_id: current_user)
    group_calendars = get_group_calendars
    @calendars = user_calendars + group_calendars
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.valid?
      @calendar.save
      redirect_to calendars_path, notice: 'Added schejule'
    else
      render 'new'
    end
  end

  def show
    @user = User.find(@calendar.user_id)
  end

  def edit; end

  def update
    @calendar.update(calendar_params)
    if @calendar.valid?
      flash[:notice] = 'Updated schejule'
      redirect_to calendar_path(@calendar.id)
    else
      render 'edit'
    end
  end

  def destroy
    @calendar.destroy
    flash[:notice] = 'Deleted schejule'
    redirect_to calendars_path
  end

  private

  def set_calendar
    @calendar = Calendar.find(params[:id])
  end

  def calendar_params
    params.require(:calendar).permit(
      :title,
      :content,
      :start_time,
      :end_time
    ).merge(user_id: current_user.id)
  end

  def get_group_calendars
    usergroups = UserGroup.where(user_id: current_user.id)
    group_ids = []
    usergroups.each do |usergroup|
      group_ids << usergroup.group_id
    end
    CalendarForGroup.where(group_id: group_ids)
  end

end
