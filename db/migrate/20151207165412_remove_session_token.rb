class RemoveSessionToken < ActiveRecord::Migration
  def change
    remove_index :users, :session_token_id
    remove_column :users, :session_token_id
  end
end
