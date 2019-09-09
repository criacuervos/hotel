require 'date'

module Hotel
  class Reservation
    attr_reader :check_in, :check_out, :room
    attr_accessor :date_range
    def initialize(date_range, room = nil, block_reference = nil )
      if room
        @room = room
      end 
      if block_reference
        @block_reference = block_reference
      end 
      @date_range = date_range
    end

    def cost
      total_stay = @date_range.check_out - @date_range.check_in - 1 
      cost = total_stay * 200
      return cost
    end 
  end   
end  