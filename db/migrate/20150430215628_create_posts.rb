class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content, null: false
      t.integer :reputation, default: 0
      t.boolean :best, default: false
      t.references :user
      t.references :question

      t.timestamps
    end
  end
end
