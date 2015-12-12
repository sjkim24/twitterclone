json.id @user.id
json.username @user.username
json.tweets @user.tweets do |tweet|
  json.extract! tweet, :id, :tweet
end
