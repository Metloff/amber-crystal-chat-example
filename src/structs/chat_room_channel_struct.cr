module ChatRoomChannelStruct
  class Message
    JSON.mapping(
      event: String,
      topic: String,
      subject: String,
      payload: Payload
    )
  end

  class Payload
    JSON.mapping(
      message: String,
      room_id: Int64,
    )
  end
end