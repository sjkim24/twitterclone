json.id @user.id
json.username @user.username
json.tweets @tweets do |tweet|
  json.extract! tweet, :id, :tweet
end
