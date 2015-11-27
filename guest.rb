class Guest
    attr_reader :name
    def initialize(name)
        @name = name
    end

    def check_in(hotel, guests)
        guests = guests.push(self)
        if !hotel.has_capacity?(guests.count)
            puts "The hotel doesn't currently have the capacity for that number of guests"
            return
        end        
        rooms = hotel.book_rooms(guests.count)
        take_rooms(rooms, guests)
   end
    
    def take_rooms(rooms, guests)
        rooms.each {|room| room.occupy(guests.pop(room.capacity))}
    end
end
