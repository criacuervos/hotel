require_relative 'reservation'
require_relative 'date_range'

module Hotel
  class Reservation_Maker
    attr_reader :rooms 
    attr_accessor :reservations
    
    def initialize
      rooms = Array(1..20)
      @rooms = rooms
      @reservations = []
    end 

    def reserve_room(check_in, check_out)
      i = 0
      room = rooms[i+1]
      date_range = Hotel::Date_Range.new(check_in, check_out)
      reservation = Hotel::Reservation.new(date_range, room)
      return reservation 
    end

    def add_reservation(reservation)
      @reservations << reservation
      return @reservations
    end 

    def reservations_lookup(date)
      all_reservations_by_date = []
      #you can compare dates with < / > 
      #you can pass in a date and a reservation should be able to tell if it overlaps/contains that date 
      #.include? as a method in reservation class
      @reservations.each do |reservation|
        if reservation.date_range.include?(date)
          all_reservations_by_date << reservation
        end 
      end 
      return all_reservations_by_date 
    end 

    def available_rooms(check_in, check_out)
      # start_date and end_date should be instances of class Date
      return []
    end 


  end
end