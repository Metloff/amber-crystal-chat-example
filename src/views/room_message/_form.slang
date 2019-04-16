- if room_message.errors
  ul.errors
    - room_message.errors.each do |error|
      li = error.to_s

== form(action: "/room_messages/#{room_message.id.to_s}", method: room_message.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == label(:room)
    == select_field(name: "room_id", collection: Room.all.map{|room| [room.id, room.id]}, selected: room_message.room_id, class: "form-control")
  .form-group
    == label(:user)
    == select_field(name: "user_id", collection: User.all.map{|user| [user.id, user.id]}, selected: room_message.user_id, class: "form-control")
  .form-group
    == text_area(name: "message", content: room_message.message, placeholder: "Message", class: "form-control", size: "30x10")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/room_messages", class: "btn btn-light btn-sm")
