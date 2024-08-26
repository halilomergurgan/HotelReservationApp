class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :room
  belongs_to :channel, optional: true
  belongs_to :hotel, optional: true
  belongs_to :guest

  def as_json(options = {})
    super(options).merge({
                           'created_at' => created_at.strftime('%Y-%m-%d %H:%M:%S'),
                           'updated_at' => updated_at.strftime('%Y-%m-%d %H:%M:%S')
                         })
  end

  validates :start_date, :end_date, presence: true
  validate :end_date_after_start_date
  validate :channel_or_hotel_present
  validate :availability_check, on: :create

  before_save :calculate_total_price
  after_save :mark_dates_unavailable

  private

  def end_date_after_start_date
    if end_date <= start_date
      errors.add(:end_date, "must be after the start date")
    end
  end

  def channel_or_hotel_present
    if channel.nil? && hotel.nil?
      errors.add(:base, "Either channel or hotel must be provided")
    end
  end

  def availability_check
    available_days = room.calendars.where(date: start_date..end_date, available: true).count
    total_days = (end_date - start_date).to_i + 1

    if available_days < total_days
      errors.add(:base, "The room is not available for the selected dates.")
    end
  end

  def calculate_total_price
    total_days = (end_date - start_date).to_i + 1
    daily_price = room.calendars.where(date: start_date..end_date).average(:price) || room.price
    self.total_price = total_days * daily_price
  end

  def mark_dates_unavailable
    room.calendars.where(date: start_date..end_date).update_all(available: false)
  end
end
