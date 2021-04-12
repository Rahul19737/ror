class AddUserIdToVisitors < ActiveRecord::Migration[6.1]
  def change
    add_column :visitors, :user_id, :integer
    add_index :visitors, :user_id
  end
end
