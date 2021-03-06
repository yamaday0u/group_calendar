class CalendarsController < ApplicationController
  before_action :set_user, only: [:index, :create]
  before_action :set_calendar, only: [:show, :edit, :destroy]

  def index
    @calendars = @user.calendars
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = @user.calendars.new(calendar_params)
    if @user.save
      flash[:success] = "Success to add schejule"
      redirect_to calendars_path
    else
      render 'new'
    end
  end

  def show
  end

  def edit
    
  end

  def destroy
    @calendar.destroy
    redirect_to calendars_path
  end

  private
  def set_calendar
    set_user
    @calendar = @user.calendars.find(params[:id])
  end

  def set_user
    @user = current_user
  end

  def calendar_params
    params.require(:calendar).permit(
      :title,
      :content,
      :start_time,
      :end_time
    )
  end

end
