-- +micrate Up
-- SQL in section 'Up' is executed when this migration is applied
ALTER TABLE room_messages
ADD username varchar(255);

-- +micrate Down
-- SQL section 'Down' is executed when this migration is rolled back
ALTER TABLE room_messages
DROP COLUMN username;
