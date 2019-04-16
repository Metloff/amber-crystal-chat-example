.row
  .col-sm-11
    h2 Room Messages
  .col-sm-1
    a.btn.btn-success.btn-sm href="/room_messages/new" New
.table-responsive
  table.table.table-striped
    thead
      tr
        th Room
        th User
        th Message
        th Actions
    tbody
      - room_messages.each do |room_message|
        tr
          td = room_message.room.id
          td = room_message.user.id
          td = room_message.message
          td
            span
              == link_to("Show", "/room_messages/#{room_message.id}", class: "btn btn-info btn-sm")
              == link_to("Edit", "/room_messages/#{room_message.id}/edit", class: "btn btn-success btn-sm")
              == link_to("Delete", "/room_messages/#{ room_message.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")
