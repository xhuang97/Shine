class CreateNewsLetters < ActiveRecord::Migration
  def change
    create_table :news_letters do |t|
      t.string :email, null: false
      t.timestamps null: false
    end
  end
end
