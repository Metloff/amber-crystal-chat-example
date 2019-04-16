class ChatRoomChannel < Amber::WebSockets::Channel
  def handle_joined(client_socket, message)
  end

  def handle_message(client_socket, message)
    user = User.find message["payload"]["user_id"]
    if user
      un = user.first_letters
    else
      un = "NA"
    end

    begin
      msg = RoomMessage.new()
      msg.username = un 
      msg.message = message["payload"]["message"].to_s
      msg.user_id = message["payload"]["user_id"].to_s.to_i64
      msg.room_id = message["payload"]["room_id"].to_s.to_i64
      msg.save!
      
      ChatSocket.broadcast("message", "chat_room:hello", "message_new", {
        "message" => msg,
      })
    rescue ex
      puts ex.message
    end
  end

  def handle_leave(client_socket)
    ChatSocket.broadcast("message", "chat_room:hello", "message_new", {
      "type" => "info",
      "message" => "User leave the chat",
    })
  end
end
