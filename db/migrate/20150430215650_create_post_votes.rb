class CreatePostVotes < ActiveRecord::Migration
  def change
    create_table :post_votes do |t|
      t.references :user
      t.references :post

      t.boolean :vote
      t.timestamps
    end
  end
end
