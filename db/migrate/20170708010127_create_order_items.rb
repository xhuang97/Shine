class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :quantity, null: false
      t.string :item_name, null: false
      t.timestamps null: false
    end
  end
end
