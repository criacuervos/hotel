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

      #in reserve room, we just call available rooms method and pick an available room from the array
    def reserve_room(check_in, check_out)
      date_range = Hotel::Date_Range.new(check_in, check_out)

      avail_rooms = available_rooms(date_range)
      available_room = avail_rooms[0]
 
      reservation = Hotel::Reservation.new(date_range, available_room)
      return reservation 
    end

    def add_reservation(reservation)
      reservations << reservation
      return reservations
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

    def available_rooms(date_range)
      #go through reservations and find all reservations that overlap with passed in date range
      #go through rooms and find a room not included in those overlapping reservations
      unavail_rooms = []

      reservations.each do |reservation|
        if reservation.date_range.date_overlap?(date_range)
          unavail_rooms << reservation.room 
        end 
      end 

      avail_rooms = [] 
      #Choose a room not contained in unavailable rooms 
      #If its NOT included then i DO want it 
      rooms.each do |room|
        unless unavail_rooms.include?(room)
          avail_rooms << room
        end 
      end 
      return avail_rooms 
    end 

  end
end