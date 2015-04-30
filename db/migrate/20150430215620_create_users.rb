class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.integer :reputation
      t.string :profile_pic
      
      t.timestamps
    end
  end
end
