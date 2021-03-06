class ChatsController < ApplicationController
  before_action :authenticate_user!

  def index
    @chats = Chat.includes(:group).where(group_id: params[:group_id]).order(created_at: :desc).page(params[:page]).per(10)
    @chat = Chat.new
    @group = Group.find(params[:group_id])
  end

  def create
    @chat = Chat.new(chat_params)
    if @chat.save
      @user = current_user
      @time = @chat.created_at.strftime('%Y-%m-%-d %-H:%-M')
      ActionCable.server.broadcast 'chat_channel', content: @chat, user: @user, time: @time
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
