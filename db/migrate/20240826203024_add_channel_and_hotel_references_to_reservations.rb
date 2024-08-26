class AddChannelAndHotelReferencesToReservations < ActiveRecord::Migration[7.2]
  def change
    add_reference :reservations, :channel, null: false, foreign_key: true
    add_reference :reservations, :hotel, null: false, foreign_key: true
  end
end
