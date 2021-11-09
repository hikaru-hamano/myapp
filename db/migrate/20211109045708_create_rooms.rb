class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.string :image_id
      t.string :name
      t.integer :money
      t.string :address
      t.date :start
      t.date :finish
      t.integer :people
      t.timestamps
    end
  end
end
