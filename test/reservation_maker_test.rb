require_relative 'test_helper'

describe Hotel::Reservation_Maker do
  before do 
    @reservation_maker = Hotel::Reservation_Maker.new
    @date = Date.parse("2020-08-04")
  end 

  describe "wave 1" do
    describe "initiation" do
      it "returns a list of all rooms" do
        rooms = @reservation_maker.rooms
        expect(rooms).must_be_kind_of Array
        expect(rooms.length).must_equal 20
      end
    end 
    
    describe "reserve room" do
      it "can take two dates and return a Reservation" do
        check_in = @date
        check_out = @date + 4
        reservation = @reservation_maker.reserve_room(check_in, check_out)
        expect(reservation).must_be_kind_of Hotel::Reservation 
      end 
    end 
    
    describe "add reservation" do
      #Check to see that add_reservations method outputs an array of all reservations which exist
      it "is a list of reservations" do
        check_in = @date
        check_out = @date + 4
        reservation = @reservation_maker.reserve_room(check_in, check_out)
        @reservation_maker.add_reservation(reservation)

        expect(@reservation_maker.reservations).must_be_kind_of Array 
      end 
    end 
    
    describe "look up reservations by date" do
      it "returns a list of reservations by date" do
        reservation_list = @reservation_maker.reservations_lookup(@date)

        expect(reservation_list).must_be_kind_of Array 
        reservation_list.each do |reservation|
          reservation.must_be_kind_of Reservation 
        end 
      end 
    end 
  end 

  describe "wave 2" do 
    describe "available_rooms" do
      it "takes a date range and returns list of available rooms" do 
        check_in = @date 
        check_out = @date + 6
        date_range = (check_in...check_out)

        room_list = @reservation_maker.available_rooms(date_range)
        expect(room_list).must_be_kind_of Array
      end 
    end 
  end 
end 