class Room
    attr_reader :capacity
    def initialize(capacity)
        @capacity = capacity
        @occupants = []
    end

    def occupy(guests)
        @occupants.concat(guests.to_a) 
    end
end
