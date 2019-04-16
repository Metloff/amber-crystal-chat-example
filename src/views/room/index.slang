/ .row
/   .col-sm-11
/     h2 Rooms
/   .col-sm-1
/     a.btn.btn-success.btn-sm href="/rooms/new" New
/ .table-responsive
/   table.table.table-striped
/     thead
/       tr
/         th Name
/         th Actions
/     tbody
/       - rooms.each do |room|
/         tr
/           td = room.name
/           td
/             span
/               == link_to("Show", "/rooms/#{room.id}", class: "btn btn-info btn-sm")
/               == link_to("Edit", "/rooms/#{room.id}/edit", class: "btn btn-success btn-sm")
/               == link_to("Delete", "/rooms/#{ room.id }?_csrf=#{csrf_token}", "data-method": "delete", "data-confirm": "Are you sure?", class: "btn btn-danger btn-sm")

.row
  .col-12.col-md-3
    == render(partial: "_rooms_list.slang")
  
  .col
    .alert.alert-primary
      h4.alert-heading Welcome to the Chat!
      hr
      p You can create or join a room from the sidebar