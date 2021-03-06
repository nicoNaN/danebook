class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :post_id
      t.integer :user_id
      t.integer :photo_id, null: true
      t.text :content

      t.timestamps null: false
    end
  end
end
