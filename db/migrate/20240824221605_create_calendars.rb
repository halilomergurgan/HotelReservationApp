class CreateCalendars < ActiveRecord::Migration[7.2]
  def change
    create_table :calendars do |t|
      t.references :room, null: false, foreign_key: true
      t.date :date
      t.boolean :available
      t.decimal :price

      t.timestamps
    end
  end
end
