- active = context.request.path == "/" ? "active" : ""
li.nav-item class=active
  a.nav-link href="/" Home
- active = context.request.path == "/rooms" ? "active" : ""
li.nav-item class=active
  a class="nav-link" href="/rooms" Rooms
- active = context.request.path == "/room_messages" ? "active" : ""
