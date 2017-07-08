class CreateUserRegistries < ActiveRecord::Migration
  def change
    create_table :user_registries do |t|

      t.timestamps null: false
    end
  end
end
