json.array! @follows do |follow|
  json.id follow.id
  json.follower_id follow.follower_id
  json.user_id follow.user_id
end
