class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast "room_channel", message: data['message']
    # first we used the line above because we wanted to broadcast the message from the client to the server, but to persist the message in the database, we write the code below
    Message.create! content: data['message']
  end
end
