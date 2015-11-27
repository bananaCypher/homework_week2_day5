class Room
    attr_reader :capacity, :cost
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
        @cost = capacity*90
    end

    def occupy(guest)
        @occupants.push(guest) 
    end

    def show_occupants
        "This #{capacity} bedroom room is occupied by " + @occupants.map {|guest| "#{guest.name}"}.join(', ')
    end
end
