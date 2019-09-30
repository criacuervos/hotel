require 'date'
class ReservationError < StandardError
end

module Hotel
  class Block 
    attr_accessor :date_range
    
    def initialize(check_in, check_out, block_rooms = nil, discount = nil)

      @check_in = check_in
      @check_out = check_out 
      
      if block_rooms 
        if block_rooms.length > 5 || block_rooms.length < 1
          raise ReservationError, "You can only have up to 5 rooms in a block"
        end 
      end 

      total_nights = (@check_out) - (@check_in) - 1
      @discount = total_nights * 150
    end
  end 
end 