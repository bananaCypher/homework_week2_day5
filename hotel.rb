class Hotel
    attr_accessor :name, :all_rooms, :available_rooms
    def initialize(name, rooms)
        @name = name
        @all_rooms = rooms
        @available_rooms = @all_rooms
        @occupied_rooms = []
    end

    def free_rooms
       @available_rooms.count 
    end

    def used_rooms
        @occupied_rooms.count
    end

    def max_capacity
        @all_rooms.inject(0) { |capacity, room| capacity + room.capacity } 
    end

    def current_capacity
        @available_rooms.inject(0) { |capacity, room| capacity + room.capacity }
    end

    def has_capacity?(guest_count)
        return true if free_rooms > 0
    end

    def book_room
        room = @available_rooms.pop
        @occupied_rooms.push(room)
        room
    end

    def checkout(room)
        @available_rooms.push(room)
        @occupied_rooms.delete(room)
    end

    def show_occupied_rooms
        @occupied_rooms.each {|room| puts room.show_occupants}
    end

    def occupancy_report
        puts "Occupancy report:-"
        puts "Free rooms: #{free_rooms}" 
        puts "Used rooms: #{used_rooms}"
        puts "Current capacity(actual beds) #{current_capacity}"
        puts "Chart of current capacity compared to maximum capacity"
        puts make_bar_chart(current_capacity, max_capacity)
    end

    def revenue_report
        puts "Revenue report:-"
        puts "Revenue per night: £#{current_revenue}"
        puts "Unoccupied room loss: £#{lost_revenue}"
        puts "Maximum possible revenue: £#{max_revenue}"
        puts "Chart of current revenue compared to maximum revenue"
        puts make_bar_chart(current_revenue, max_revenue)
    end

    def occupancy_hash
        {
            'free' => "#{free_rooms}", 
            'occupied' => "#{used_rooms}", 
            'chart' => "#{make_bar_chart(current_capacity, max_capacity)}"
        }
    end

    def revenue_hash
        {
            'per night' => current_revenue,
            'loss' => lost_revenue,
            'max' => max_revenue,
            'chart' => make_bar_chart(current_revenue, max_revenue)
        }
    end

    private
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
