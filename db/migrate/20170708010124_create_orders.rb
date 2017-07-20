class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.float :grand_total, null: false
   	  t.date :date_ordered
      t.timestamps null: false
    end
  end
end
