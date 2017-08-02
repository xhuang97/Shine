class CreateRegistryItemFields < ActiveRecord::Migration
  def change
    create_table :registry_item_fields do |t|
      t.integer :registry_item_id
      t.string :prompt, null: false
      t.timestamps null: false
    end
  end
end
