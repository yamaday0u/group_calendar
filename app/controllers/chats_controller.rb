class ChatsController < ApplicationController
  def index
    @chats = Chat.includes(:group).where(group_id: params[:id])
  end
end
