class CreateRooms < ActiveRecord::Migration[7.2]
  def change
    create_table :rooms do |t|
      t.string :name
      t.references :room_type, null: false, foreign_key: true
      t.decimal :price

      t.timestamps
    end
  end
end
