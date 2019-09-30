require_relative 'test_helper'

describe "Block class" do 
  before do 
    @reservation_maker = Hotel::Reservation_Maker.new 
    @check_in = Date.new(2020, 01, 01)
    @check_out = @check_in + 4
    @block_rooms = @reservation_maker.rooms[0..3]
    @discount = 150

    @block = Hotel::Block.new(@check_in, @check_out, @block_rooms, @discount)
    @room = @block_rooms[0]
  end 

  describe "initialize" do
    it "is an instance of Block" do 
      expect(@block).must_be_kind_of Hotel::Block
    end 
    
    it "raises an error if room count is greater than max of 5" do
      block_rooms = @reservation_maker.rooms[0..20]
      expect{ Hotel::Block.new(@check_in, @check_out, block_rooms) }.must_raise ReservationError
    end 

    
  end 
end 