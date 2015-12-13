json.id @user.id
json.username @user.username
json.tweets @user_tweets do |tweet|
  json.extract! tweet, :id, :tweet
end
json.following @following
