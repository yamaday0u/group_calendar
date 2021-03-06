class CalendarsController < ApplicationController
  def index
    @user = current_user
    @calendars = @user.calendars
  end

  def new
    @calendar = Calendar.new
  end

  def create
    @user = current_user
    @calendar = @user.calendars.new(calendar_params)
    if @user.save
      flash[:success] = "Success to add schejule"
      redirect_to calendars_path
    else
      render 'new'
    end
  end

  def show
    @user = current_user
    @calendar =  @user.calendars.find(params[:id])
  end

  def destroy
  
    
  end
  private
  def calendar_params
    params.require(:calendar).permit(
      :title,
      :content,
      :start_time,
      :end_time
    )
  end

end
