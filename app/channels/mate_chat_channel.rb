class MateChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "mate_chat_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
