class AddGuestReferenceToReservations < ActiveRecord::Migration[7.2]
  def change
    add_reference :reservations, :guest, null: false, foreign_key: true
  end
end
