class ChangeUserIdToGuestId < ActiveRecord::Migration[6.1]
  def change
    rename_column :visitors, :user_id, :guest_id
  end
end
