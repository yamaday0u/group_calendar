class GroupCalendarChatsController < ApplicationController
  before_action :authenticate_user!

  def create
    @group_calendar_chat = GroupCalendarChat.new(group_calendar_chat_params)
    if @group_calendar_chat.save
      @user = current_user
      @time = @group_calendar_chat.created_at.strftime('%Y-%m-%-d %-H:%-M')
      ActionCable.server.broadcast 'group_calendar_chat_channel', content: @group_calendar_chat, user: @user,
                                                                  time: @time
    end
  end

  private

  def group_calendar_chat_params
    params.require(:group_calendar_chat).permit(:text).merge(
      user_id: current_user.id,
      calendar_for_group_id: params[:calendar_for_group_id]
    )
  end
end
