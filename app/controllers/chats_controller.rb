class ChatsController < ApplicationController
  def index
    @chats = Chat.includes(:group).where(group_id: params[:id])
    @chat = Chat.new
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      @user = current_user
      ActionCable.server.broadcast 'chat_channel', content: @chat, user: @user
    end
  end

  private
  def chat_params
    params.require(:chat).permit(:text).merge(
      user_id: current_user.id,
      group_id: params[:group_id]
    )
  end
end
