- if room.errors
  ul.errors
    - room.errors.each do |error|
      li = error.to_s

== form(action: "/rooms/#{room.id.to_s}", method: room.id ? :patch : :post) do
  == csrf_tag
  .form-group
    == text_field(name: "name", value: room.name, placeholder: "Name", class: "form-control")
  == submit("Submit", class: "btn btn-success btn-sm")
  == link_to("Back", "/rooms", class: "btn btn-light btn-sm")
