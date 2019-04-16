.mb-3
  == link_to("Create a room", "/rooms/new", class: "btn btn-primary")

- if rooms.size > 0
  .nav.flex-column
    - rooms.each do |room|
      == link_to("#{room.name}", "/rooms/#{room.id}", class: "nav-link room-nav-link")
- else
  .text-muted The are no rooms