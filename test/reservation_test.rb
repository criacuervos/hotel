require_relative 'test_helper'

describe "Reservation class" do
  describe "initialize" do

    it "is an instance of Reservation" do
      check_in = Date.new(2019, 9, 03)
      check_out = check_in + 4 #A four day stay
      date_range = Hotel::Date_Range.new(check_in, check_out)
      reservation = Hotel::Reservation.new(date_range)

      expect(reservation).must_be_kind_of Hotel::Reservation
    end 
  end

  describe 'cost' do
    it "returns total cost of a reservation" do
      check_in = Date.new(2017, 4, 23)
      check_out = check_in + 7
      date_range = Hotel::Date_Range.new(check_in, check_out)
      
      reservation = Hotel::Reservation.new(date_range)

      expect(reservation.cost).must_equal 1200
    end
  end 
end 