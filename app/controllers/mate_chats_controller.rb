class MateChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    room_mate_id = RoomUser.where(room_id: params[:room_id]).where.not(user_id: current_user.id)
    @room_mate = User.find(room_mate_id[0].user_id)
    @mate_chats = MateChat.includes(:room).where(room_id: params[:room_id]).order(created_at: :desc).page(params[:page]).per(10)
    @mate_chat = MateChat.new
  end

  def create
    @mate_chat = MateChat.new(mate_chat_params)
    if @mate_chat.save
      @user = current_user
      @time = @mate_chat.created_at.strftime('%Y-%m-%-d %-H:%-M')
      ActionCable.server.broadcast 'mate_chat_channel', content: @mate_chat, user: @user, time: @time
    end
  end

  private

  def mate_chat_params
    params.require(:mate_chat).permit(:text).merge(
      user_id: current_user.id,
      room_id: params[:room_id]
    )
  end
end
