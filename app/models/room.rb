class Room < ApplicationRecord
  belongs_to :room_type
  has_many :reservations
  has_many :calendars

  def as_json(options = {})
    super(options).merge({
                           'created_at' => created_at.strftime('%Y-%m-%d %H:%M:%S'),
                           'updated_at' => updated_at.strftime('%Y-%m-%d %H:%M:%S')
                         })
  end
end
