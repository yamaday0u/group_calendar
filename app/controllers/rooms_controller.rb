class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :is_room_exist?, only: :create

  def index
    @mates = current_user.matchers
    user_rooms = RoomUser.where(user_id: current_user.id)

    @room_id = []
    user_rooms.each do |user_room|
      @mates.each do |mate|
        mate_rooms = RoomUser.where(user_id: mate.id)
        mate_rooms.each do |mate_room|
          if user_room.room_id == mate_room.room_id
            @room_id << user_room.room_id
          end
        end
      end
    end

    @room = Room.new
  end

  def create
    room = Room.new(room_params)
    if room.save
      redirect_to room_mate_chats_path(room.id)
    end
  end


  private

  def is_room_exist?
    user_ids = params[:room][:user_ids]
    first_room_users = RoomUser.where(user_id: user_ids[0])
    second_room_users = RoomUser.where(user_id: user_ids[1])

    matched_room_user = ""
    first_room_users.each do |first_room_user| 
      second_room_users.each do |second_room_user|
        if first_room_user.room_id == second_room_user.room_id
          matched_room_user = first_room_user.room_id
        end
      end
    end

    if matched_room_user.present?
      redirect_to room_mate_chats_path(matched_room_user)
    end
  end

  def room_params
    params.require(:room).permit(user_ids: [])
  end

  def method_name
    
  end
end
