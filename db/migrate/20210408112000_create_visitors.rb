class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.string :checked_in
      t.string :name
      t.string :phone_number
      t.string :reason_of_visit

      t.timestamps
    end
  end
end
