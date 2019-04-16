class RoomMessage < Granite::Base
  adapter pg
  table_name room_messages

  belongs_to :room

  belongs_to :user

  primary id : Int64
  field message : String
  field username : String
  field user_id : Int64
  field room_id : Int64
  timestamps
end
