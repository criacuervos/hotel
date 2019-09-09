require_relative 'test_helper'

describe "Block class" do 
  before do 
    check_in = Date.new(2020, 01, 01)
    check_out = check_in + 4
    @reservation_maker = Hotel::Reservation_Maker.new 
    @date_range = Hotel::Date_Range.new(check_in, check_out)
    @block_rooms = @reservation_maker.rooms[0..3]
    @discount = 150

    @block = Hotel::Block.new(@date_range, @block_rooms, @discount)
    @room = @block_rooms[0]
  end 

  describe "initialize" do
    it "is an instance of Block" do 
      expect(@block).must_be_kind_of Hotel::Block
    end 
  end 
  
  describe "add block to list of blocks" do
    it "returns a list of all blocks" do
      block_array = @reservation_maker.add_block(@block)
      expect(block_array).must_be_kind_of Array
    end 
  end 

  describe "reserve in block" do
    it "reserves a room inside of a block" do 
      @block_reservation = @reservation_maker.reserve_from_block(@check_in, @check_out)
      expect(@block_reservation).must_be_kind_of Hotel::Reservation 
    end
  end 
end 