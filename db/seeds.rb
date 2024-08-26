# Channels
channels = %w[Airbnb Booking Expedia Direct]
channels.each do |channel|
  Channel.find_or_create_by!(name: channel)
end

# Hotels
hotels = [ 'Radisson', 'JW Marriott', 'Hilton', 'Hyatt' ]
hotels.each do |hotel|
  Hotel.find_or_create_by!(name: hotel)
end

# Rooms Calendar Seeding
Room.find_each do |room|
  (Date.today.beginning_of_year..Date.today.end_of_year).each do |date|
    room.calendars.find_or_create_by!(
      date: date,
      available: [ true, false ].sample,
      price: room.price + rand(-10..10)
    )
  end
end
