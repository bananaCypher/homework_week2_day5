class Hotel
    attr_accessor :name, :all_rooms, :available_rooms
    def initialize(name, rooms)
        @name = name
        @all_rooms = [].concat(rooms)
        @available_rooms = [].concat(rooms)
    end

    def max_capacity
        @all_rooms.inject(0) { |capacity, room| capacity + room.capacity } 
    end

    def current_capacity
        @available_rooms.inject(0) { |capacity, room| capacity + room.capacity }
    end

    def has_capacity?(guest_count)
        return true if guest_count <= current_capacity
    end

    def book_rooms(guest_count)
        rooms = []
        while guest_count != 0 do
            room = biggest_room_to_fit_guests(guest_count)
            @available_rooms.delete(room)
            guest_count -= room.capacity
            rooms.push(room)
        end
        rooms
    end

    private
    def biggest_room_to_fit_guests(guest_count)
       @available_rooms.uniq.sort_by{|room| -room.capacity}.detect{|room|room.capacity <= guest_count}
    end
end
