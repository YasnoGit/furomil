class CreateBookmarks < ActiveRecord::Migration[6.1]
  def change
    create_table :bookmarks do |t|
      t.references :customer, null: false, foreign_key: true
      t.references :facility, null: false, foreign_key: true

      t.timestamps
    end

    add_index :bookmarks, [:customer_id, :facility_id], unique: true
  end
end
