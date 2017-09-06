class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :title
      t.text :desription
      t.integer :quantity
      t.integer :price

      t.timestamps
    end
  end
end
