# frozen_string_literal: true

class CommentsChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'comments'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def checkIn(data)
  #   room_id = "#{data['room_id']}"
  #   stream_from "messages_room_#{room_id}"
  # end

  # def checkout
  #   stop_all_streams
  # end
end
