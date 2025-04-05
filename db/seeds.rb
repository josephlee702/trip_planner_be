User.destroy_all
Trip.destroy_all
Itinerary.destroy_all

user1 = User.create(
    name: "Joseph Lee", 
    email: "jhjlee702@gmail.com", 
    password: "ffffff", 
    password_confirmation: "ffffff"
  )

japan_trip = Trip.create(
    name: "S. Korea and Japan '25", 
    start_date: "2025-04-01", 
    end_date: "2025-04-20", 
    destinations: ["South Korea", "Japan"]
  )

itinerary1 = Itinerary.create(
  name: "Day 1", 
    description: "Start the trip in Tokyo!", 
    start_date: "2025-04-01", 
    end_date: "2025-04-01", 
    trip_id: japan_trip.id, 
    user_id: user1.id
  )

puts "Seeded successfully!"