class AddNameAndPhNumToGuests < ActiveRecord::Migration[6.1]
  def change
    add_column :guests, :name, :string
    add_column :guests, :phone_number, :string
  end
end
