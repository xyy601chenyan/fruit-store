class AddPublicOnToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :publish_on, :date
  end
end
