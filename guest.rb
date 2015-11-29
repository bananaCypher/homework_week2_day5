class Guest
    attr_reader :name
    def initialize(name)
        @name = name
        @current_room = nil
    end

    def check_in(hotel)
        if !hotel.has_capacity?(1)
            puts "The hotel doesn't currently have the capacity for that number of guests"
            return
        end        
        room = hotel.book_room
        room.occupy(self)
        @current_room = room
    end

    def checkout(hotel)
        if !@current_room
            puts "You are not checked into any rooms"
            return  
        end
        hotel.checkout(@current_room)
        @current_room.unoccupy
        @current_room = nil
    end
end
