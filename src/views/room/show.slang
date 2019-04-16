h1 = room.name
.row
  .col-12.col-md-3
    == render(partial: "_rooms_list.slang")

  .col
    .chat#chat
      - room_messages.each do |room_message|
        .row.chat-message-container
          .col-auto.text-center
            .circle = room_message.username

          .col
            .message-content
              .mb-1 = room_message.message
              .text-right
                small = room_message.created_at



    == form(class: "form-group", id: "message-form") do
      .input-group.mb-3
        == text_field(name: "message", id: "message", class: "form-control", placeholder: "Your message here", autofocus: "", required: "")
        == hidden_field(name: "room_id", id: "room_id", value: "#{ room.id }")
        == hidden_field(name: "user_id", id: "user_id", value: "#{ user_id }")

    / == form(action: "/room_messages", method: :post) do
    /   == csrf_tag
