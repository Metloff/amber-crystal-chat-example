class Room < Granite::Base
  adapter pg
  table_name rooms

  has_many :room_messages, class_name: RoomMessage

  primary id : Int64
  field name : String
  timestamps
end
