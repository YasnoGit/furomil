class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.text :comment, null: false
      t.integer :customer_id, null: false
      t.integer :facility_id, null: false
      t.float :score, default: 0.0, null: false

      t.timestamps
    end
  end
end
