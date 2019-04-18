class ChatRoomChannel < Amber::WebSockets::Channel
  def handle_joined(client_socket, message)
  end

  def handle_message(client_socket, message)
    return if !client_socket
      
    current_user = User.find client_socket.session[:user_id]
    return if !current_user

    begin
      msg = RoomMessage.new(
        username: current_user.first_letters,
        message: message["payload"]["message"].to_s,
        user_id: current_user.id,
        room_id: message["payload"]["room_id"].to_s.to_i64,
      )
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
