class CalendarsController < ApplicationController
  before_action :authenticate_user!
  # before_action :set_user, only: %i[index create]
  # before_action :set_calendar, only: %i[show edit update destroy]

  def index
    @calendars = Calendar.where(user_id: current_user)
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @calendar = Calendar.new(calendar_params)
    if @calendar.save
      redirect_to calendars_path, notice: 'Added schejule'
    else
      render 'new'
    end
  end

  def show; end

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

  # def set_calendar
  #   set_user
  #   @calendar = @user.calendars.find(params[:id])
  # end

  # def set_user
  #   @user = current_user
  # end

  def calendar_params
    params.require(:calendar).permit(
      :title,
      :content,
      :start_time,
      :end_time
    ).merge(user_id: current_user.id)
  end
end
