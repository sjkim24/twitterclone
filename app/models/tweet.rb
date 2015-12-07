class Tweet < ActiveRecord::Base

  belongs_to :user,
    class_name: "User",
    foreign_key: :user_id,
    primary_key: :id

  validates :tweet, presence: true, length: { maximum: 140 }

end
