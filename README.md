# Hotel Reservation API

This is a RESTful API for managing hotel reservations. The API is built using Ruby on Rails and supports JWT authentication. Users can manage room types, rooms, calendars, and reservations through the API.

## Features

- User Authentication with JWT
- Manage Room Types, Rooms, and Reservations
- Check Room Availability
- Price Calculation Based on Room Type and Date

## Prerequisites

- Ruby 3.3.4
- Rails 7.2
- MySQL 8.0
- Bundler

## Installation

To set up the project, follow these steps:

```bash
git clone https://github.com/halilomergurgan/HotelReservationApp.git
cd hotel-reservation-api
bundle install
rails db:create
rails db:migrate
rails db:seed
echo "DEVISE_JWT_SECRET_KEY=your_secret_key_here" > .env
echo "DATABASE_USERNAME=your_mysql_username" >> .env
echo "DATABASE_PASSWORD=your_mysql_password" >> .env

rails server
```
## Authentication
To authenticate, send a POST request to /users/sign_in with your email and password. The response will include a JWT token.
```bash
curl -X POST http://localhost:3000/users/sign_in \
-H "Content-Type: application/json" \
-d '{"user": {"email": "user@example.com", "password": "password"}}'
```

Example API Calls
You can retrieve all room types with:

```bash
curl -H "Authorization: Bearer your_jwt_token" \
http://localhost:3000/room_types
```

To create a reservation, send a POST request to /reservations:
```bash
curl -X POST http://localhost:3000/reservations \
-H "Content-Type: application/json" \
-H "Authorization: Bearer your_jwt_token" \
-d '{
  "reservation": {
    "room_name": "Room 101",
    "room_type": "Single",
    "start_date": "2024-09-01",
    "end_date": "2024-09-05",
    "channel": "Airbnb"
  },
  "guest": {
    "email": "guest@example.com",
    "first_name": "John",
    "last_name": "Doe"
  }
}'
```

## Contributing
To contribute to this project

## License
This project is licensed under the MIT License - see the LICENSE file for details.