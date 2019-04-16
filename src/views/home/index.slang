.row.justify-content-center
  .col-sm-12.col-md-12
    h2 Welcome to Chat
    / h3 Please register to start chatting
    / - if user = session["user"]
    /   p You are
    /     span#user
    /       = user
    /     a#logout.btn.btn-danger.btn-xs href="/logout"
    /       | Logout
    /   div#messages
    /   == form(class: "form-group", id: "message-form") do
    /     == text_field(name: "message", id: "message", class: "form-control", placeholder: "Your message here", autofocus: "", required: "")
    /   - :end
    / - else
    /   == form(action: "/register", class: "form-group") do
    /     == csrf_tag
    /     == text_field(name: "user", class: "form-control", placeholder: "Your name here", autofocus: "", required: "")
    /   - :end