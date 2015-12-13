json.array! @tweets do |tweet|
  json.id tweet.id
  json.tweet tweet.tweet
  json.user_id tweet.user_id
end
