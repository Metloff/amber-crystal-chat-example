require "../config/application"

user = User.new
user.email = "admin@example.com"
user.password = "password"
user.save
