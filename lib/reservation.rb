require 'date'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room
    attr_accessor :date_range

    def initialize(check_in, check_out, room = nil, block_reference = nil )
      @check_in = check_in
      @check_out = check_out 

      if room
        @room = room
      end 
      if block_reference
        @block_reference = block_reference
      end 
    end

    def cost
      total_stay = @check_out - @check_in - 1 
      cost = total_stay * 200
      return cost
    end 
  end   
end  