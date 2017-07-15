class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
 	  t.string :name, null: false
 	  t.boolean :for_profit, null: false
 	  t.boolean :is_active, null: false
 	  t.string :industry
      t.timestamps null: false
    end
  end
end
