class ChangeChannelAndHotelNullInReservations < ActiveRecord::Migration[7.2]
  def change
    change_column_null :reservations, :channel_id, true
    change_column_null :reservations, :hotel_id, true
  end
end
