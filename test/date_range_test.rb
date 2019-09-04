require_relative 'test_helper'

describe Hotel::Date_Range do
  describe 'initialize' do
    it "can be initialized with two dates" do
      check_in = Date.new(2018, 9, 03)
      check_out = check_in + 4

      reservation_length = Hotel::Date_Range.new(check_in, check_out)

      expect(reservation_length.check_in).must_equal check_in
      expect(reservation_length.check_out).must_equal check_out
    end 

    it "raises an ArgumentError when 0 length stay is created" do
      check_in = Date.new(2018, 10, 10)
      check_out = check_in 

      expect{ Hotel::Date_Range.new(check_in, check_out) }.must_raise ArgumentError
    end

    it "raises an ArgumentError when check out is before check in" do
      check_in = Date.new(2018, 5, 05)
      check_out = Date.new(2018, 5, 01)
      
      expect{ Hotel::Date_Range.new(check_in, check_out) }.must_raise ArgumentError
    end 
  end
end 