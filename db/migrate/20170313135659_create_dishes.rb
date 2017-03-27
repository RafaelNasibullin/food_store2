class CreateDishes < ActiveRecord::Migration[5.0]
  def change
    create_table :dishes do |t|
      t.string :name
      t.decimal :price
      t.string :desc
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
