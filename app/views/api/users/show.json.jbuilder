json.id @user.id
json.username @user.username
json.tweets @user_tweets do |tweet|
  json.extract! tweet, :id, :tweet
end

json.following @following

json.followers @followers do |follower|
  json.user_id follower.follower_id
end

json.followings @followings do |following|
  json.follower_id following.user_id
end
