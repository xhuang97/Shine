class CreateRegistries < ActiveRecord::Migration
  def change
    create_table :registries do |t|
 	  t.string :title, null: false
 	  t.text :description
 	  t.boolean :is_active, null: false
      t.timestamps null: false
    end
  end
end
