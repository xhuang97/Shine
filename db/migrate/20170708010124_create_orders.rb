class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.float :grand_total
   	  t.date :date_ordered, null: false
      t.timestamps null: false
    end
  end
end
