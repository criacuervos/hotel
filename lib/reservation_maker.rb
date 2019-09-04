require_relative 'reservation'

module Hotel
  class Reservation_Maker
    attr_reader :rooms
    
    def initialize
      rooms = Array(1..20)
      @rooms = rooms
    end 

    def reserve_room(check_in, check_out)
      i = 0
      room = rooms[i+1]
      return Hotel::Reservation.new(check_in, check_out, room)
    end

    def reservations_by_date(check_in, check_out)
      return #an array of reservations
    end 


    
  end
end