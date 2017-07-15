class UserRegestry < ActiveRecord::Migration
  def change
  	 create_table :assignments_user_regestries, :id => false do |t|
      t.integer :user_id
      t.integer :registry_id
    end
  end
end
