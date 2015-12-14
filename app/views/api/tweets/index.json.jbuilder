json.array! @all_tweets do |tweet|
  json.id tweet.id
  json.tweet tweet.tweet
  json.user_id tweet.user_id
  json.username tweet.user.username
end
