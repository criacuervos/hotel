require 'date'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room
    #[code bloc]
    def initialize(check_in, check_out, room = nil)
      @check_in = check_in
      @check_out = check_out
      if room
        @room = room
      end 
    end

    def cost
      total_stay = @check_out - @check_in - 1 
      cost = total_stay * 200
      #could replace with nights method to find out total nights instead of doing the math
      return cost
    end 
  end   
end  