class HotelChain
    attr_reader :hotels
    attr_writer :hotels
    def initialize(hotels)
        @hotels = hotels
    end

    def occupancy_report
        puts "Occupancy report:-"
       @hotels.each_value do |hotel| 
        details = hotel.occupancy_hash
        puts "\t#{hotel.name}"
        puts "\t\tFree rooms: #{details['free']}"
        puts "\t\tOccupied rooms: #{details['occupied']}"
        puts "\t\tChart of current capacity compared to maximum capacity"
        puts "\t\t#{details['chart']}"
       end
    end 

    def revenue_report
        puts "Revenue report:-"
        @hotels.each_value do |hotel|
            details = hotel.revenue_hash
            puts "\t#{hotel.name}"
            puts "\t\tRevenue per night: £#{details['per night']}"
            puts "\t\tUnoccupied room loss: £#{details['loss']}"
            puts "\t\tMaximum possible revenue: £#{details['max']}"
            puts "\t\tChart of current revenue compared to maximum revenue"
            puts "\t\t#{details['chart']}"
        end
    end
end
