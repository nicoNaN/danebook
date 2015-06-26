class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :college
      t.string :hometown
      t.string :residence
      t.string :phone_number
      t.text :quotes
      t.text :about

      t.timestamps null: false
    end
  end
end
