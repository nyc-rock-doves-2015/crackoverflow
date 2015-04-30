class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false, unique: true
      t.string :password_digest, null: false
      t.integer :reputation, default: 0
      t.string :profile_pic

      t.timestamps
    end
  end
end
