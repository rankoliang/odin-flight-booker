# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def airport_codes(n, codes = [])
  codes + ('AAA'..'ZZZ').to_a.sample(n)
end

airport_codes(15, %w[LGA SFO]).each do |code|
  Airport.create(code: code)
end

airports = Airport.all

100.times.each do
  origin, destination = airports.sample(2)
  origin.departing_flights.create(destination: destination,
                                  departure_time: Faker::Time.forward(days: 200),
                                  duration: rand(60..360).minutes)
end
