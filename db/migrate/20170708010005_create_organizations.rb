class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
 	  t.integer :user_id
 	  t.string :name
 	  t.boolean :for_profit
 	  t.boolean :is_active
 	  t.string :industry
      t.timestamps null: false
    end
  end
end
