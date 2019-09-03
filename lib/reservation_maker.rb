require_relative 'reservation'

module Hotel
  class Reservation_Maker
    attr_reader :rooms

    rooms = [1..20]
    @rooms = rooms
    
    def reserve_room(check_in, check_out)

      return Reservation.New(check_in, check_out, room)
    end

    def reservations_by_date(check_in, check_out)

      return
    end 


    
  end
end