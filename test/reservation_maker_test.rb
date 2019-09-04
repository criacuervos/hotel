require_relative 'test_helper'

describe Hotel::Reservation_Maker do
  before do 
    @reservation_maker = Hotel::Reservation_Maker.new
    @date = Date.parse("2020-08-04")
  end 
  
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

  describe "reservations by date" do
    it "returns a list of reservations by date" do
    end 
  end 


end 