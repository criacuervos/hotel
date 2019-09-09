require 'date'
class ReservationError < StandardError
end

module Hotel
  class Block 
    attr_accessor :date_range
    
    def initialize(date_range, block_rooms = nil, discount = nil)
      reservation_maker = Hotel::Reservation_Maker.new

      @date_range = date_range

      total_nights = (@date_range.check_out) - (@date_range.check_in) - 1
      @cost = total_nights * 150
      if block_rooms 
        if block_rooms.length > 5 || block_rooms.length < 1
          raise ReservationError, "You can only have up to 5 rooms in a block"
        elsif 
          available_rooms = reservation_maker.available_rooms(date_range)
          available_rooms.include?(block_rooms)
          @block_rooms = block_rooms
        elsif raise ReservationError, "One of the requested rooms is blocked for the given date range."
        end 
      end  
    end
  end 
end 