class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.integer :user_id, null: false
      t.integer :following_id, null: false
    end

    add_index :followings, [:following_id, :user_id], unique: true
  end
end
