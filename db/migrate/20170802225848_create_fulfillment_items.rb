class CreateFulfillmentItems < ActiveRecord::Migration
  def change
    create_table :fulfillment_items do |t|
      t.integer :registry_item_field_id
      t.boolean :user_boolean
      t.text :user_text
      t.timestamps null: false
    end
  end
end
