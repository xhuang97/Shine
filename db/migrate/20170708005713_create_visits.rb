class CreateVisits < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.string :referral
      t.timestamps :timestamp, null: false
    end
  end
end
