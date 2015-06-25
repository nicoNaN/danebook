class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.datetime :birthday
      t.string :gender
      t.string :password_digest
      t.string :auth_token

      t.timestamps null: false
    end

    add_index :users, :email, unique: true
    add_index :users, :password_digest, unique: true
    add_index :users, :auth_token, unique: true
  end
end
