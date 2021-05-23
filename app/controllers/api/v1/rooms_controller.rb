class Api::V1::RoomsController < ApplicationController
  # before_action :authenticate_user!
  # protect_from_forgery with: :null_session

  # def index
  #   mates = current_user.matchers
  #   rooms = Room.where(talker_1: current_user.id)
  # data = []
  # data << mates
  # data << current_user
  # data << rooms
  # render json: data
  # end

  # def create
  #   room = Room.new(talker_1: current_user.name, talker_2: params[:user_id])
  #     if room.save
  #       redirect_to "/rooms/#{room.id}"
  #     else
  #       redirect_to "/rooms"
  #     end
  # end
end
