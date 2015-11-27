class Hotel
    attr_accessor :name, :all_rooms, :available_rooms
    def initialize(name, rooms)
        @name = name
        @all_rooms = [].concat(rooms)
        @available_rooms = [].concat(rooms)
        @occupied_rooms = []
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

    def book_room
        room = biggest_room_to_fit_guests(1)
        @available_rooms.delete(room)
        @occupied_rooms.push(room)
        room
    end

    def checkout(room)
        @available_rooms.push(room)
    end

    def show_occupied_rooms
        @occupied_rooms.each {|room| puts room.show_occupants}
    end

    def occupancy_report
        puts "Occupancy report:-"
        puts "free rooms: #{current_capacity}" 
        puts "used rooms: #{max_capacity - current_capacity}"
        puts make_bar_chart(current_capacity, max_capacity)
    end

    def revenue_report
        puts "Revenue report:-"
        puts "revenue per night: £#{current_revenue}"
        puts "unoccupied room loss: £#{lost_revenue}"
        puts "maximum revenu: £#{max_revenue}"
        puts make_bar_chart(current_revenue, max_revenue)
    end

    private
    def biggest_room_to_fit_guests(guest_count)
        @available_rooms.uniq.sort_by{|room| -room.capacity}.detect{|room|room.capacity <= guest_count}
    end

    def max_revenue
        @all_rooms.inject(0){|sum, room|sum + room.cost}
    end

    def current_revenue
        @occupied_rooms.inject(0) {|sum, room| sum + room.cost}
    end

    def lost_revenue
        @available_rooms.inject(0){|sum, room|sum + room.cost}
    end

    def make_bar_chart(current, max)
        percent = (current.to_f / max.to_f) * 100
        left_percent = 100 - percent
        "0% |#{"=" * percent}#{percent.to_i}%#{"-" * left_percent}| 100%"
    end
end
