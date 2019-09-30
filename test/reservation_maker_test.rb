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

      it "is an accurate list of reservations" do
        check_in = @date
        check_out = @date + 5
        @reservation = Hotel::Reservation.new(check_in, check_out)
        @reservation_maker.add_reservation(@reservation)

        expect(@reservation_maker.reservations).must_be_kind_of Array 
        expect(@reservation_maker.reservations.length).must_equal 1
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
      before do 
        check_in = @date 
        check_out = @date + 6
        date_range = (check_in...check_out)
      end 

      it "takes a date range and returns list of available rooms" do 
        check_in = @date 
        check_out = @date + 6
        date_range = (check_in...check_out)

        room_list = @reservation_maker.available_rooms(date_range)
        expect(room_list).must_be_kind_of Array
        expect(room_list.length).must_equal 20
      end

    end 
  end 

  describe "wave 3" do
    before do 
      @reservation_maker = Hotel::Reservation_Maker.new 
      @check_in = Date.new(2020, 01, 01)
      @check_out = @check_in + 4
      @block_rooms = @reservation_maker.rooms[0..3]
      @discount = 150
  
      @block = Hotel::Block.new(@check_in, @check_out, @block_rooms, @discount)
      @room = @block_rooms[2, 3]
    end 

    describe "add block to list of blocks" do
      it "returns an accurate list of all blocks" do
        block_array = @reservation_maker.add_block(@block)
        expect(block_array).must_be_kind_of Array
        expect(block_array.length).must_equal 1
      end 
    end 

    describe "reserve from block" do
      it "reserves a room inside of a block" do 
        @reservation_maker.add_block(@block)

        @block_reservation = @reservation_maker.reserve_from_block(@check_in, @check_out)
        expect(@block_reservation).must_be_kind_of Hotel::Reservation 
      end

      it "can reserve a block even if there is a reservation for the same date" do 
        check_in = Date.new(2019, 05, 05)
        check_out = check_in + 5
        @reservation = Hotel::Reservation.new(check_in, check_out)
        @reservation_maker.add_reservation(@reservation) 

        @block 
      end 
      
    end 
  end 
end 