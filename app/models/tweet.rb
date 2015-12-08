class Tweet < ActiveRecord::Base

  belongs_to :user

  validates :tweet, presence: true, length: { maximum: 140 }

end
