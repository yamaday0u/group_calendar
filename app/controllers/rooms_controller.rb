class RoomsController < ApplicationController
  before_action :authenticate_user!

  def index
    @mates = current_user.matchers
    @room = Room.new
    @rooms = Room.where(talker_1: current_user.id)
  end

  def create
    room = Room.new(room_params)
    if room.save
      redirect_to room_path(room.id)
    else
      redirect_to root_path
    end
  end

  def show
    @room = Room.find(params[:id])
  end


  private

  def room_params
    params.require(:room).permit(user_ids: [])
  end
end
