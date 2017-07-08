class CreateRegistryItems < ActiveRecord::Migration
  def change
    create_table :registry_items do |t|
      t.integer :y, null: false
      t.integer :x, null: false
      t.string :content_type, null: false
      t.timestamps null: false
    end
  end
end
