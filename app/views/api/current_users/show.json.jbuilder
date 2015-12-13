if logged_in?
  json.id @current_user.id
  json.username @current_user.username
else
  json.logged_in? logged_in?
end
