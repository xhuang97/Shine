class CreateFufillmentItems < ActiveRecord::Migration
  def change
    create_table :fufillment_items do |t|
      t.boolean :userBoolean
      t.text :userText
      t.timestamps null: false
    end
  end
end
