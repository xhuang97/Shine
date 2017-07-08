class CreateRegistryItemFields < ActiveRecord::Migration
  def change
    create_table :registry_item_fields do |t|
      t.string :prompt, null: false
      t.timestamps null: false
    end
  end
end
