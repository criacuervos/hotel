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

  describe "include?" do
    it "checks whether a date is included in a Reservation" do
      check_in = Date.new(2019, 2, 03)
      check_out = check_in + 3
      date = Date.new(2019, 2, 04)
      reservation = Hotel::Date_Range.new(check_in, check_out)
      
      expect(reservation.include?(date)).must_equal true
    end 
  end 

  describe "nights" do
    it "returns the correct number of nights" do
      check_in = Date.new(2019, 10, 10)
      check_out = check_in + 5
      range = Hotel::Date_Range.new(check_in, check_out)

      expect(range.nights).must_equal 5
    end
  end 

  describe "overlap?" do
    before do
      check_in = Date.new(2019, 04, 23)
      check_out = check_in + 5

      @range = Hotel::Date_Range.new(check_in, check_out)
    end

    it "returns true for the same range" do
      check_in = @range.check_in
      check_out = @range.check_out
      
      test_range = Hotel::Date_Range.new(check_in, check_out)

      expect(@range.date_overlap?(test_range)).must_equal true
    end

    it "checks whether range is containing other" do
      check_in = Date.new(2019, 04, 24)
      check_out = check_in + 1

      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal true 
    end 

    it "returns true if range is contained in other" do 
      check_in = Date.new(2019, 04, 20)
      check_out = check_in + 10

      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal true 
    end 

    it "checks whether reservation starts before another ends" do
      check_in = Date.new(2019, 04, 25)
      check_out = check_in + 5

      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal true 
    end 

    it "returns false for a range starting on the check_out date" do
      check_in = @range.check_out
      check_out = check_in + 3

      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal false
    end 

    it "returns false for a range ending on the check_in date" do
      check_in = Date.new(2019, 04, 18)
      check_out = @range.check_in
      
      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal false
    end 

    it "returns false for a range completely before other" do 
      check_in = Date.new(2019, 01, 01)
      check_out = check_in + 5

      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal false
    end 

    it "returns false for a date completely after" do
      check_in = Date.new(2019, 12, 30)
      check_out = check_in + 5

      test_range = Hotel::Date_Range.new(check_in, check_out)
      expect(@range.date_overlap?(test_range)).must_equal false
    end 
  end 
end 