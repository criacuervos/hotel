require_relative 'reservation'
require_relative 'date_range'
require_relative 'block'
class ReservationError < StandardError
end

module Hotel
  class Reservation_Maker
    attr_reader :rooms 
    attr_accessor :reservations, :blocks
    
    def initialize
      rooms = Array(1..20)
      @rooms = rooms
      @reservations = []
      @blocks = []
    end 

    def reserve_from_block(check_in, check_out)
      date_range = Hotel::Date_Range.new(check_in, check_out)
      block = block_lookup(date_range)
      rooms = available_rooms(date_range)
      room = rooms[0]

      if room == nil
        raise ReservationError.new("There are no available rooms for the chosen block")
      end 

      block_reference = Hotel::Block.new(check_in, check_out)
      block_reservation = Hotel::Reservation.new(check_in, check_out, room, block_reference)
      add_reservation(block_reservation)
      return block_reservation 
    end 

    def block_lookup(date_range)
      @blocks.find { |block| block.date_range == date_range }
    end 

    def reserve_room(check_in, check_out)
      date_range = Hotel::Date_Range.new(check_in, check_out)

      @reservations.each do |reservation|
        check_in = reservation.check_in
        check_out = reservation.check_out
        other = Hotel::Date_Range.new(check_in, check_out)
        if date_range.date_overlap?(other)
          raise ReservationError.new("Reservation overlaps with existing reservation")
        end 
      end 
      avail_rooms = available_rooms(date_range)
      available_room = avail_rooms[0]
 
      reservation = Hotel::Reservation.new(date_range, available_room)
      add_reservation(reservation)
      return reservation 
    end

    def add_reservation(reservation)
      reservations << reservation
      return reservations
    end 

    def add_block(block)
      blocks << block
      return blocks
    end 

    def reservations_lookup(date)
      all_reservations_by_date = []
      @reservations.each do |reservation|
        if reservation.date_range.include?(date)
          all_reservations_by_date << reservation
        end 
      end 
      return all_reservations_by_date 
    end 

    def available_rooms(date_range)
      unavail_rooms = []

      reservations.each do |reservation|
        if reservation.date_range.date_overlap?(date_range)
          unavail_rooms << reservation.room 
        end 
      end 

      avail_rooms = [] 
      rooms.each do |room|
        unless unavail_rooms.include?(room)
          avail_rooms << room
        end 
      end 
      return avail_rooms 
    end 
  end
end