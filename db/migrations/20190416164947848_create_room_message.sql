-- +micrate Up
CREATE TABLE room_messages (
  id BIGSERIAL PRIMARY KEY,
  room_id BIGINT,
  user_id BIGINT,
  message TEXT,
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);
CREATE INDEX room_message_room_id_idx ON room_messages (room_id);
CREATE INDEX room_message_user_id_idx ON room_messages (user_id);

-- +micrate Down
DROP TABLE IF EXISTS room_messages;
