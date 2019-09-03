require_relative 'test_helper'

describe "Reservation class" do
  describe "initialize" do

    it "is an instance of Reservation" do
      check_in = Date.new(2019, 9, 03)
      check_out = check_in + 4 #A four day stay
      reservation = Hotel::Reservation.new(check_in, check_out, room: nil)
      expect(reservation).must_be_kind_of Hotel::Reservation
    end 


  end
end 