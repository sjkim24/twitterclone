class AddNullConstraintToCreatedAt < ActiveRecord::Migration
  def change
    change_column :tweets, :created_at, :datetime, null: false
  end
end
