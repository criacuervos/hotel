require 'date'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room_id
    #[code bloc]
    def initialize(check_in, check_out, room: nil)
      @check_in = check_in
      @check_out = check_out
    end

    
  end   
end  