class GroupCalendarChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'group_calendar_chat_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
