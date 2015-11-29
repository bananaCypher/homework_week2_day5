class Room
    attr_reader :capacity, :cost
    def initialize(capacity)
        @capacity = capacity
        @occupant = nil
        @cost = capacity*90
    end

    def occupy(guest)
        @occupant = guest
    end

    def show_occupants
        "This #{capacity} bedroom room is occupied by #{@occupant.name}"
    end

    def unoccupy()
        @occupant = nil
    end
end
