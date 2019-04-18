struct ChatSocket < Amber::WebSockets::ClientSocket
  channel "chat_room:*", ChatRoomChannel
  
  def on_connect
    # if user = session["user"]
    #   !user.blank?
    # end
    # @current_user = User.find session["user_id"]
    # puts session["user_id"]
    true
  end
end
