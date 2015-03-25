def create_user(options = {})
  User.create!({
    first_name: "Bill",
    last_name: "Clinton",
    username: "RedditBill",
    email: "Bill@Clinton.com",
    password: "123",
  }.merge(options))
end

def create_post(options = {})
  Post.create!({
    title: "Test Title",
    content: "Words go here",
    user_id: nil
  }.merge(options))
end
