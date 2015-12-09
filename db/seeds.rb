u1 = User.create(username: "guest", password: "password")
u2 = User.create(username: "sj", password: "password")
u3 = User.create(username: "webster", password: "password")
u4 = User.create(username: "zd", password: "password")

t1 = Tweet.create(tweet: "tweet #1 from guest", user_id: u1.id)
t2 = Tweet.create(tweet: "tweet #2 from guest", user_id: u1.id)
t3 = Tweet.create(tweet: "tweet #1 from sj", user_id: u2.id)
t4 = Tweet.create(tweet: "tweet #2 from sj", user_id: u2.id)
t5 = Tweet.create(tweet: "tweet #1 from webster", user_id: u3.id)
t6 = Tweet.create(tweet: "tweet #2 from webster", user_id: u3.id)
t7 = Tweet.create(tweet: "tweet #1 from zd", user_id: u4.id)
t8 = Tweet.create(tweet: "tweet #2 from zd", user_id: u4.id)
t9 = Tweet.create(tweet: "tweet #3 from zd", user_id: u4.id)
t10 = Tweet.create(tweet: "tweet #4 from zd", user_id: u4.id)

f1 = Follow.create(follower_id: u1.id, user_id: u2.id)
#u2 is following u1<-> u1 has a follower of u2
f2 = Follow.create(follower_id: u1.id, user_id: u3.id)
f3 = Follow.create(follower_id: u1.id, user_id: u4.id)
f4 = Follow.create(follower_id: u2.id, user_id: u3.id)
f5 = Follow.create(follower_id: u2.id, user_id: u4.id)
f6 = Follow.create(follower_id: u3.id, user_id: u4.id)
f7 = Follow.create(follower_id: u4.id, user_id: u3.id)
