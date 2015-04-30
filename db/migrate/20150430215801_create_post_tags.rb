class CreatePostTags < ActiveRecord::Migration
  def change
    create_table :post_tags do |t|
      t.references :post
      t.references :tag

      t.timestamps
    end
  end
end
