class CreateTweets < ActiveRecord::Migration
  def change
    create_table :tweets do |t|
      t.text :tweet, limit: 140, null: false
      t.integer :user_id, null: false
    end
  end
end
