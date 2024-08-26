class CreateReservations < ActiveRecord::Migration[7.2]
  def change
    create_table :reservations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.decimal :total_price

      t.timestamps
    end
  end
end
