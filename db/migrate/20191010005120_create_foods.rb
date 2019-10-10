class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.date :expiration_date
      t.float :quantity
      t.string :quantity_unit
      t.float :value
      t.string :food_category
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
