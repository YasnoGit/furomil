class CreateFacilities < ActiveRecord::Migration[6.1]
  def change
    create_table :facilities do |t|
      t.integer :area_id, null: false
      t.string :name, null: false
      t.text :introduction, null: false
      t.integer :price, null: false
      t.string :open, null: false
      t.string :holiday, null: false
      t.float :score, null: false, default: 0
      t.timestamps
    end
  end
end
