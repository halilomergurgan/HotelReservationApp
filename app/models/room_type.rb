class RoomType < ApplicationRecord
  has_many :rooms

  def as_json(options = {})
    super(options).merge({
                           'created_at' => created_at.strftime('%Y-%m-%d %H:%M:%S'),
                           'updated_at' => updated_at.strftime('%Y-%m-%d %H:%M:%S')
                         })
  end
end
