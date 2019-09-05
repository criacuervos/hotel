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
    before do
      #Make reservations to check if they are properly looked up
      #First two reservations include 8/5
      #Third does not
      check_in1 = Date.parse("2020-08-04")
      check_out1 = check_in1 + 4
      check_in2 = Date.parse("2020-08-04")
      check_out2 = check_in2 + 2
      check_in3 = Date.parse("2019-02-10")
      check_out3 = check_in3 + 6
      reservation1 = @reservation_maker.reserve_room(check_in1, check_out1)
      reservation2 = @reservation_maker.reserve_room(check_in2, check_out2)
      reservation3 = @reservation_maker.reserve_room(check_in3, check_out3)
      @reservation_maker.add_reservation(reservation1)
      @reservation_maker.add_reservation(reservation2)
      @reservation_maker.add_reservation(reservation3)

      @date = Date.parse("2020-08-05")

      @reservation_list = @reservation_maker.reservations_lookup(@date)
            
      @accurate_dates = []
      @accurate_dates << reservation1
      @accurate_dates << reservation2
    end 

    it "returns a list of reservations by date" do
      expect(@reservation_list).must_be_kind_of Array 
    end 

    it "returns an accurate list of all reservations by date" do
      expect(@reservation_list).must_equal @accurate_dates
    end 
  end 
end 