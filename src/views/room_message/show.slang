h1 Show Room Message
p = room_message.room.id
p = room_message.user.id
p = room_message.message
p
  == link_to("Back", "/room_messages", class: "btn btn-light btn-sm")
  == link_to("Edit", "/room_messages/#{room_message.id}/edit", class: "btn btn-success btn-sm")
  == link_to("Delete", "/room_messages/#{room_message.id}?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
