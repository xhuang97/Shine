class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_2
      t.string :street_1, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zipcode, null: false
      t.timestamps null: false
    end
  end
end
