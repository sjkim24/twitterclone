class CreateRetweets < ActiveRecord::Migration
  def change
    create_table :retweets do |t|
      t.integer :user_id, null: false
      t.integer :tweet_id, null: false
      t.text :comment, null: false
      t.text :tweets, null: false
      t.timestamps
    end
  end
end
