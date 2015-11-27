require 'pry-byebug'
require_relative('room')
require_relative('hotel')
require_relative('guest')
require_relative('chain')

room_1 = Room.new(2)
room_2 = Room.new(2)
room_3 = Room.new(1)
room_4 = Room.new(1)
room_5 = Room.new(1)

rooms = [room_1, room_2, room_3, room_4, room_5]

hotel = Hotel.new('The Ruby Hotel', rooms)

# Hotel display it's capacity
max_capacity = hotel.max_capacity
puts "The maximum capacity of the Hotel is #{max_capacity}, expect 7"
cur_capacity = hotel.current_capacity
puts "The current capacity of the Hotel is #{cur_capacity}, expect 7"
puts "\n"

# Guests
guest_1 = Guest.new('Bill')
guest_2 = Guest.new('John')
guest_3 = Guest.new('Brenda')
guest_4 = Guest.new('Sandra')
guest_5 = Guest.new('Barbra')
guest_6 = Guest.new('Mike')
guest_7 = Guest.new('Paul')
guest_8 = Guest.new('Greg')
guest_9 = Guest.new('Lisa')
guest_10 = Guest.new('Alex')
guest_11 = Guest.new('Sarah')
guest_12 = Guest.new('Georgia')

puts "Check Bill into a room"
guest_1.check_in(hotel)
hotel.show_occupied_rooms
puts "Check John into a room"
guest_2.check_in(hotel)
hotel.show_occupied_rooms
puts "Check Sarah into a room"
guest_11.check_in(hotel)
hotel.show_occupied_rooms
puts "\n"

hotel.occupancy_report
puts "\n"
hotel.revenue_report
puts "\n"

hotel_2 = Hotel.new("Callum's place", [Room.new(2), Room.new(5), Room.new(1), Room.new(3), Room.new(1)])
guest_12.check_in(hotel_2)
guest_5.check_in(hotel_2)

chain = HotelChain.new({"#{hotel.name}" => hotel, "#{hotel_2.name}" => hotel_2})
chain.occupancy_report
puts "\n"
chain.revenue_report
puts "\n"

binding.pry; ''
