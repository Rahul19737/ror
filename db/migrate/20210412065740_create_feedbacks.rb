class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.string :feedback
      t.integer :guest_id

      t.timestamps
    end
    add_index :feedbacks, :guest_id
  end
end
